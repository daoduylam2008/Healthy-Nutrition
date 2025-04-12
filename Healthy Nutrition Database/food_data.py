import pandas as pd
import json

data = pd.read_csv("assets/nutrients_csvfile.csv")
data = data.to_dict()

n = len(data["Food"])

new_data = {}


def empty_data(data):
    if str(data) == "nan":
        return None
    return data


for i in range(0, n):
    new_data[data["Food"][i].lower()] = {
        "Measure": empty_data(data["Measure"][i]),
        "Grams": empty_data(data["Grams"][i]),
        "Calories": empty_data(data["Calories"][i]),
        "Protein": empty_data(data["Protein"][i]),
        "Fat": empty_data(data["Fat"][i]),
        "Sat.Fat": empty_data(data["Sat.Fat"][i]),
        "Fiber": empty_data(data["Fiber"][i]),
        "Carbs": empty_data(data["Carbs"][i]),
        "Category": empty_data(data["Category"][i])
    }

with open("assets/food_data.json", 'w') as file:
    json.dump(new_data, file)