from dotenv import load_dotenv

import os, pymongo
import util
from pprint import pprint


load_dotenv()


url = os.environ.get("MONGODB_CONNECT")
client = pymongo.MongoClient(url)
database = client["healthy_nutrition"]

class UserInformation:
    def __init__(self):
        self.info_col = database["infos"]
    
    def create(self, user_id, username):
        if self.search(user_id) is None:
            data = {
                "user_id": user_id,
                "username": username,
                "last_name": "",
                "first_name": "",
                "email": "",
                "history": {},
                "height": "",
                "weight": "",
                "goal": "",
                "age": "",
                "favorite": []
            }

            self.info_col.insert_one(data)
            return data
    
    def search_email(self, email):
        return self.info_col.find_one({"email": email})
    
    def search_by_username(self, username):
        data = self.search(username)
        pprint(data)
        del data["_id"]
        return data

    def update(self, username, query, data):
        if query != None and query == "email" and self.search_email(data) is not None:
            return False
        
        user_info = self.search_by_username(username)
        new_data = { "$set": { query: data } }
        self.info_col.update_one(user_info, new_data)

        return True
  

class Users:
    def __init__(self):
        self.user_col = database["users"]
        self.infos = UserInformation()

    def create(self, username, password):
        if self.search(username) is None:
            user_id = util.convert_to_id(username),
            data = {
                "user_id": user_id,
                "username": username,
                "password": password
            }
            self.user_col.insert_one(data)
            self.infos.create(user_id, username)
            data = {
                "Authorization": util.generate_new_token(username)
            }
            return data


    def search(self, username):
        return self.user_col.find_one({"username": username})
    
    def update(self, username, query, data):
        old_data = self.search(username)
        new_data = { "$set": { query: data } }
        self.user_col.update_one(old_data, new_data)
