from dotenv import load_dotenv

import os, pymongo
from pymongo.server_api import ServerApi

import util


load_dotenv()


url = "mongodb+srv://daoduylam:ngGzoao5juXnWBgl@cluster3108.b6qb6tu.mongodb.net/?retryWrites=true&w=majority&appName=Cluster3108"
client = pymongo.MongoClient(url, server_api=ServerApi('1'))
database = client["healthy_nutrition"]
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)