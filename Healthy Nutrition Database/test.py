from dotenv import load_dotenv

import os, pymongo
import util


load_dotenv()

url = os.environ.get("MONGODB_CONNECT")
client = pymongo.MongoClient(url)
database = client["healthy_nutrition"]

food_col = database["food"]

data = food_col.find({"description": "Custard"})

for i in data:
    print(i)
     