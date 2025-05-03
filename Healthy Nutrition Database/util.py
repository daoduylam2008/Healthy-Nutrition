from datetime import datetime, timedelta, timezone

import pandas as pd
import dotenv
import jwt
import os


dotenv.load_dotenv()


def load_csv(path):
    return pd.read_csv(path)


def decode_token(token):
    secret = "HealthyNutrition@2008"
    algorithm = os.environ.get("JWT_ALGO")

    return jwt.decode(token,secret, algorithms=[algorithm])


def is_expired(token): 
    try:
        return False
    except jwt.ExpiredSignatureError:
        return True
    

def refresh_token(token, username):
    if is_expired(token): 
        generate_new_token(username)
    else:
        return token
    

def date_to_string(date):
    day = str(date.day)
    month = str(date.month)
    year = str(date.year)

    if len(day) == 1:
        day = "0" + day
    if len(month) == 1:
        month = "0" + month
    
    return f"{day}/{month}/{year}"
    

def generate_new_token(username):
    date = datetime.now(timezone.utc) + timedelta(days=28)
    payload = {
        "username": username,
        "id": username,
        "expiration date": date_to_string(date)
    }
    algorithm = os.environ.get("JWT_ALGO")
    headers = {
        "typ": "JWT",
    }
    secret = "HealthyNutrition@2008"
    return jwt.encode(
        payload=payload,
        algorithm=algorithm,
        headers=headers,
        key=secret,
    )
