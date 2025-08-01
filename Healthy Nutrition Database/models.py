from dotenv import load_dotenv
from pymongo.server_api import ServerApi

import os, pymongo
import util
import certifi

ca = certifi.where()


load_dotenv()


url = os.environ.get("MONGODB_CONNECT")
client = pymongo.MongoClient(url, server_api=ServerApi('1'), tlsCAFile=ca)
database = client["healthy_nutrition"]


class Food:
    def __init__(self):
        self.food_col = database["foods"]

    def search_category(self, category):
        results = []
        data = self.food_col.find({
            "category": category
        })
        if data != []:
            for d in data:
                del d["_id"]
                results.append(d)

        return results
    
    def search_name(self, name):
        data = self.food_col.find_one({
            "name": name
        })

        if data is not None:
            del data["_id"]

        return data
    
    def search_names(self, names):
        results = []
        for name in names:
            results.append(self.search_name(name))
        
        return results
        
    
    def search_description(self, description):
        data =  self.food_col.find_one({
            "description": description
        })
        if data is not None:
            del data["_id"]
        return data
    
    def search_foods(self, foods):
        results = []
        for food in foods:
            results.append(self.search_description(food))

        return results


class UserInformation:
    def __init__(self):
        self.info_col = database["infos"]
    
    def create(self, user_id, username, email, data):
        if self.search(user_id) is None:
            data = {
                "user_id": username,
                "username": username,
                "last_name": data["last_name"],
                "first_name": data["first_name"],
                "email": email,
                "history": {},
                "height": data["height"],
                "weight": data["weight"],
                "goal": data["goal"],
                "age": data["age"],
                "favorite": [],
                "gender": data["gender"]
            }

            self.info_col.insert_one(data)
            return data
    
    def search(self, user_id):
        return self.info_col.find_one({"user_id": user_id})
    
    def search_email(self, email):
        return self.info_col.find_one({"email": email})
    
    def search_by_username(self, username):
        data = self.search(username)
        if data is not None:
            del data["_id"]
        return data

    def update(self, username, query, data):
        if query == "email" and self.search_email(data) is not None:
            return False
        
        user_info = self.search_by_username(username)
        new_data = { "$set": { query: data } }
        self.info_col.update_one(user_info, new_data)

        return True
  

class Users:
    def __init__(self):
        self.user_col = database["users"]
        self.infos = UserInformation()

    def create(self, username, password, email, d):
        if self.search(username) is None and self.infos.search_email(email) is None:
            data = {
                "user_id": username,
                "username": username,
                "password": password
            }
            self.user_col.insert_one(data)
            self.infos.create(username, username, email, d)


            return {
                "Authorization": util.generate_new_token(username)
            }

    def search(self, username):
        return self.user_col.find_one({"username": username})

    def search_email(self, email):
        try:
            username = self.infos.search_email(email)["username"]
            return self.search(username)
        except:
            return None
    
    def update(self, username, query, data):
        self.infos.update(username, query, data)

class Goal:
    def __init__(self):
        self.goals_col = database["goals"]
    
    def search_name_calorie(self, name, calorie):
        data = self.goals_col.find_one({
            "name": name,
            "calorie": calorie
        })
        if data is not None:
            del data["_id"]
        return data
