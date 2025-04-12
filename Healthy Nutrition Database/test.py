import jwt
from datetime import datetime, timedelta

payload = {
    "data": "1234"
}

header = {
    "exp": datetime.now() + timedelta(seconds=1)
}

token = jwt.encode(payload, "secret", "HS256", headers=header)

jwt.decode(token, "secret",["HS256"])
