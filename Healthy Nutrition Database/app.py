from flask import Flask, request
from flask_bcrypt import Bcrypt
from auth_middleware import *

import models
import util

app = Flask(__name__)
bcrypt = Bcrypt(app)

users = models.Users()
infos = models.UserInformation()

queries = ["user_id", "username", "email", "history", "height", "weight", "goal", "password"]


@app.route("/")
def start_page():
    return "Hello, this is the server for Healthy Nutrition application", 200


@app.route("/login", methods=["GET"])
def login():
    args = request.json

    username = args["username"]

    user = users.search(username)

    if user is not None and bcrypt.check_password_hash(user["password"], args["password"]):
        return {
            "Authorization": util.generate_new_token(username),
            'data': user,
        }
        
    return {
        "error": "Your username or your password might be wrong"
    }, 409


@app.route("/register", methods=["POST"])
def register():
    args = request.json

    username = args["username"]
    password = bcrypt.generate_password_hash(args["password"], 12)
    new_user = users.create(username, password)

    if new_user is not None:
        return new_user, 200
    return {
        "error": "This username was taken"
    }, 409


@app.route("/info", methods=["GET"])
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
        infos.update(username, query, data)
        return {
            "message": "Successfully update your information"
        }, 200
    

@app.route("/update_user", methods=["POST"])
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
    elif users.search(username) is None:
        return {
            "error": f"Cannot find '{username}'"
        }, 409
    else:
        users.update(username, query, data)
        return {
            "message": "Successfully update your user information"
        }, 200


if __name__ == "__main__": 
    app.run()
# eyJhbGciOiJIUzI1NiIsImV4cCI6MTc0NjMxOTU0MCwidHlwIjoiSldUIn0.eyJ1c2VybmFtZSI6ImRhb2R1eWxhbSIsImlkIjoiOTAxNzk4MDExMjE3MTEwMDExMTE3OTAwMSJ9.lU0znesPH6vn0bDdtbDLHfu7wcKKEv-bZ5PH58BzqlU