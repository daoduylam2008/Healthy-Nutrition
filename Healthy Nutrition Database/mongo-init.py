from dotenv import load_dotenv

import os, pymongo

load_dotenv()

url = os.environ.get("MONGODB_CONNECT")
client = pymongo.MongoClient(url)
database = client["healthy_nutrition"]
