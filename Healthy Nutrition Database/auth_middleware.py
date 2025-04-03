import jwt, models, os, base64
from dotenv import load_dotenv
from flask import request
from functools import wraps
from pprint import pprint

load_dotenv()

def token_required(f):
    @wraps(f)
    def decorate(*args, **kwargs):
        token = None

        if "Authorization" in request.headers:
            token = request.headers["Authorization"].split()[-1]

        if not token:
            return {
                "message": "Your token is empty, you must add 'Authorized_token in your request'",
                "error": "Unauthorized",
                "data": None
            }, 401
        
        try:
            secret = "HealthyNutrition@2008"
            algorithm = os.environ.get("JWT_ALGO")

            payload = jwt.decode(token, secret, algorithms=[algorithm])

            user = models.User().user_col.find_one({"username": payload["username"]})

            if (models.User().search_user(payload) is None) or not (payload["email"] == user["email"]): 
                return {
                    "message": "Your token is wrong",
                    "error": "Unauthorized #2",
                    "data": None
                }, 401
        except jwt.ExpiredSignatureError as e:
            return {
                "message": "Your token is expired",
                "error": str(e),
                "data": None
            }, 500
        except Exception as error:
            return {
                "message": "Something went wrong",
                "error": str(error),
                "data": None
            }, 500
        
        return f(*args, **kwargs)
    
    return decorate