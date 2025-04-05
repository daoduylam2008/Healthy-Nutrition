import jwt, models, util
from dotenv import load_dotenv
from flask import request
from functools import wraps


load_dotenv()

users = models.Users()


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
