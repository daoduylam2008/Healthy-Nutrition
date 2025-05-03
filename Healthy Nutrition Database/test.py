from dotenv import load_dotenv

import os, pymongo
import util


load_dotenv()


url = os.environ.get("MONGODB_CONNECT")
client = pymongo.MongoClient(url)
database = client["healthy_nutrition"]

print(database)

users = database['users']

print(users.find_one({"username" : "daoduylam"}))