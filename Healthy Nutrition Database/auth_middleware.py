import jwt, models, util
from dotenv import load_dotenv
from flask import request
from functools import wraps
from datetime import datetime, date



load_dotenv()

users = models.Users()


def isExpired(text):
    expiration_date = datetime.strptime(text, "%d/%m/%Y").date()
    today = date.today()

    if expiration_date >= today:
        return False
    else:
        return True

def token_required(f):
    @wraps(f)
    def decorate(*args, **kwargs):
        token = None
        if "Authorization" in request.headers:
            token = request.headers["Authorization"].split()[-1]
        else:
            return {
                "message": "Your token is empty, you must add 'Authorized_token in your request'",
                "error": "Unauthorized",
                "data": None
            }, 401
        if not token:
            return {
                "message": "Your token is empty, you must add 'Authorized_token in your request'",
                "error": "Unauthorized",
                "data": None
            }, 401
        
        try:
            payload = util.decode_token(token)

            user = users.search(payload["username"])

            if (user is None): 
                return {
                    "message": "Your token is wrong",
                    "error": "Unauthorized #2",
                    "data": None
                }, 401
            elif (isExpired(payload["expiration date"])): 
                return {
                    "message": "Your token is expired",
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
