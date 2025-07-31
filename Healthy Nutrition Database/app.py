from flask import Flask, request, Response
from flask_bcrypt import Bcrypt
from auth_middleware import *
from pprint import pprint

import models
import util

app = Flask(__name__)
bcrypt = Bcrypt(app)

users = models.Users()
infos = models.UserInformation()
foods = models.Food()
goals = models.Goal()

queries = ["first_name", "last_name", "user_id", "username", "email", "history", "height", "weight", "goal", "password", "favorite", "age", "gender", "goal"]


@app.route("/")
def start_page():
    return "Hello, this is the server for Healthy Nutrition application", 200


@app.route("/login", methods=["POST"])
def login():
    args = request.json

    username = args["username"]

    if "@" in username: 
        user = users.search_email(username)
    else:
        user = users.search(username)

    if user is not None and bcrypt.check_password_hash(user["password"], args["password"]):
        del user["_id"]
        return {
            "Authorization": util.generate_new_token(user["username"]),
        }, 200
        
    return {
        "error": "Your username or your password might be wrong"
    }, 409


@app.route("/register", methods=["POST"])
def register():
    args = request.json

    username = args["username"]
    password = bcrypt.generate_password_hash(args["password"], 12)
    email = args["email"]
    data = args["data"]

    pprint(data)

    new_user = users.create(username, password, email, data)

    if new_user is not None:
        return new_user, 200
    return {
        "error": "This username or this email was taken"
    }, 409


@app.route("/info", methods=["POST"])
@token_required
def info():
    args = request.json
    username = args["username"]
    data = infos.search_by_username(username)

    if data is not None:
        return data, 200
    return {
        "error": f"Cannot find username '{username}'"
    }, 409


@app.route("/update_info", methods=["POST"])
@token_required
def update_info():
    args = request.json
    username = args["username"]
    query = args["query"]
    data = args["data"]
    
    if query not in queries:
        return {
            "error": "Your query is not invalid"
        }, 409
    elif infos.search_by_username(username) is None:
        return {
            "error": f"Cannot find '{username}'"
        }, 409
    else:
        if infos.update(username, query, data):
            return {
                "message": "Successfully update your information"
            }, 200
        return {
            "error": "This email was taken"
        }, 409
    

@app.route("/update_user", methods=["POST"])
@token_required
def update_user():
    args = request.json
    username = args["username"]
    query = args["query"]
    data = args["data"]
    
    if query not in queries:
        return {
            "error": "Your query is not invalid"
        }, 409
    elif users.search(username) is None:
        return {
            "error": f"Cannot find '{username}'"
        }, 409
    else:
        users.update(username, query, data)
        return {
            "message": "Successfully update your user information"
        }, 200



@app.route('/refresh_token', methods=["POST"])
def refresh_token():
    token = request.headers["Authorization"].split()[-1]
    token = util.refresh_token(token)

    return {
        "Authorization": str(token)
    }, 200


@app.route('/get_name', methods=["POST"])
def get_name():
    args = request.json
    name = args["name"]

    data = foods.search_name(name)

    if data is None:
        return {
            "data": None,
            "error": "Your name request has something wrong or invalid"
        }
    return {
        "data": data
    }, 200


@app.route('/get_names', methods=["POST"])
def get_names():
    args = request.json
    names = args["name"]

    data = foods.search_names(names)

    if data is None or data == []:
        return {
            "data": None,
            "error": "Your foods request has something wrong or invalid value. "
        }, 409
    
    return {
        "data": data
        }, 200


@app.route('/get_foods', methods=["POST"])
def get_foods():
    args = request.json
    f = args["foods"]

    data = foods.search_foods(f)

    if data is None or data == []:
        return {
            "data": None,
            "error": "Your foods request has something wrong or invalid value. "
        }, 409
    
    return {
        "data": data
        }, 200


@app.route('/get_category', methods=["POST"])
def get_category():
    args = request.json
    category = args["category"]
    data = foods.search_category(category)
    if data is None:
        return {
            "error": f"Cannot find {category} in the database. ",
            "data": None
        }, 409
    return {
        "data": data
    }, 200


@app.route('/get_description', methods=["POST"])
def get_description():
    args = request.json
    description = args["description"]

    data = foods.search_description(description)

    if data is None or data == []:
        return {
            "data": None,
            "error": f"Cannot find {description} in the database"
        }, 409
    return {
        "data": data
    }, 200


@app.route("/get_goals_by_name", methods=["POST"])
def get_goals_by_name():
    args = request.json
    name = args["name"]

    data = goals.search_name(name)

    if data == []:
        return {
            "data": None,
            "error": f"Cannot find {name} in the database"
        }, 409

    return {
        "data": data
    }, 200


@app.route("/get_goals_by_name_and_calorie", methods=["POST"])
def get_goals_by_name_and_calorie():
    args = request.json
    name = args["name"]
    calorie = int(args["calorie"])

    data = goals.search_name_calorie(name, calorie)

    if data == []:
        return {
            "data": None,
            "error": f"Cannot find {name} with {calorie} in the database"
        }, 409

    return {
        "data": data
    }, 200


if __name__ == "__main__": 
    app.run()
