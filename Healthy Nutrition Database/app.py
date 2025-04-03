from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def start_page():
    return "Hello, this is the server for Healthy Nutrition application", 200


@app.route("/hello", methods=["GET"])
def name():
    return request.args, 200


@app.route("/login", methods="GET")

def login():
    return 


@app.route("/register", methods="POST")
def register():
    return


if __name__ == "__main__": 
    app.run()
