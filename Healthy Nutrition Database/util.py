from datetime import datetime, timedelta, timezone

import pandas as pd
import dotenv
import jwt
import os


dotenv.load_dotenv()


def convert_to_id(text):
    result = ""
    for i in text:
        result += str(ord(i))
    
    return result

def load_csv(path):
    return pd.read_csv(path)


def decode_token(token):
    secret = "HealthyNutrition@2008"
    algorithm = os.environ.get("JWT_ALGO")

    return jwt.decode(token,secret, algorithms=[algorithm])
    


def encode_user_id(user_id):
    encode = ""

    for i in range(0, len(user_id)):
        encode += user_id[len(user_id) - 1 - i]
    
    return encode


def is_expired(token): 
    try:
        payload = jwt.decode(token)
    except jwt.ExpiredSignatureError: pass


def generate_new_token(username):
    payload = {
        "username": username,
        "id": encode_user_id(convert_to_id(username))
    }
    algorithm = os.environ.get("JWT_ALGO")
    exp = datetime.now(timezone.utc) + timedelta(days=28)
    headers = {
        "typ": "JWT",
        "exp": int(exp.strftime('%s'))
    }
    secret = "HealthyNutrition@2008"
    return jwt.encode(
        payload=payload,
        algorithm=algorithm,
        headers=headers,
        key=secret,
    )
