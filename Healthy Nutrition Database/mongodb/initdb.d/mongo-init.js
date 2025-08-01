db = db.getSiblingDB("healthy_nutrition");

db.createUser({
  user: "client",
  pwd: "pass",
  roles: [
    {
      role: "readWrite",
      db: "healthy_nutrition",
    },
  ],
});

// db.createCollection("meals");
// db.createCollection("users");
// db.createCollection("feedbacks");

// db.meals.createIndex({ date: 1 });
// db.users.createIndex({ student_id: 1, "meals.date": 1 });
// db.feedbacks.createIndex({ student_id: 1, date: 1 });

db.createCollection("infos");
db.createCollection("users");
db.createCollection("foods");
db.createCollection("goals");
db.creaseCollection("images");

db.infos.createIndex({ username: 1 });
db.users.createIndex({ username: 1 });
db.foods.createIndex({ category: 1, description: 1 });
db.goals.insertMany([{"name": "US Style Diet", "calorie": 1000.0, "carbs": 128, "protein": 45, "fat": 37}, {"name": "US Style Diet", "calorie": 1100.0, "carbs": 140, "protein": 50, "fat": 40}, {"name": "US Style Diet", "calorie": 1200.0, "carbs": 153, "protein": 54, "fat": 44}, {"name": "US Style Diet", "calorie": 1300.0, "carbs": 166, "protein": 59, "fat": 48}, {"name": "US Style Diet", "calorie": 1400.0, "carbs": 179, "protein": 63, "fat": 51}, {"name": "US Style Diet", "calorie": 1500.0, "carbs": 191, "protein": 68, "fat": 55}, {"name": "US Style Diet", "calorie": 1600.0, "carbs": 204, "protein": 72, "fat": 59}, {"name": "US Style Diet", "calorie": 1700.0, "carbs": 217, "protein": 77, "fat": 62}, {"name": "US Style Diet", "calorie": 1800.0, "carbs": 230, "protein": 81, "fat": 66}, {"name": "US Style Diet", "calorie": 1900.0, "carbs": 242, "protein": 86, "fat": 70}, {"name": "US Style Diet", "calorie": 2000.0, "carbs": 255, "protein": 90, "fat": 73}, {"name": "US Style Diet", "calorie": 2100.0, "carbs": 268, "protein": 95, "fat": 77}, {"name": "US Style Diet", "calorie": 2200.0, "carbs": 281, "protein": 99, "fat": 81}, {"name": "US Style Diet", "calorie": 2300.0, "carbs": 293, "protein": 104, "fat": 84}, {"name": "US Style Diet", "calorie": 2400.0, "carbs": 306, "protein": 108, "fat": 88}, {"name": "US Style Diet", "calorie": 2500.0, "carbs": 319, "protein": 113, "fat": 92}, {"name": "Vegetarian Style Diet", "calorie": 1000.0, "carbs": 130, "protein": 45, "fat": 36}, {"name": "Vegetarian Style Diet", "calorie": 1100.0, "carbs": 143, "protein": 50, "fat": 39}, {"name": "Vegetarian Style Diet", "calorie": 1200.0, "carbs": 156, "protein": 54, "fat": 43}, {"name": "Vegetarian Style Diet", "calorie": 1300.0, "carbs": 169, "protein": 59, "fat": 46}, {"name": "Vegetarian Style Diet", "calorie": 1400.0, "carbs": 182, "protein": 63, "fat": 50}, {"name": "Vegetarian Style Diet", "calorie": 1500.0, "carbs": 195, "protein": 68, "fat": 53}, {"name": "Vegetarian Style Diet", "calorie": 1600.0, "carbs": 208, "protein": 72, "fat": 57}, {"name": "Vegetarian Style Diet", "calorie": 1700.0, "carbs": 221, "protein": 77, "fat": 60}, {"name": "Vegetarian Style Diet", "calorie": 1800.0, "carbs": 234, "protein": 81, "fat": 64}, {"name": "Vegetarian Style Diet", "calorie": 1900.0, "carbs": 247, "protein": 86, "fat": 68}, {"name": "Vegetarian Style Diet", "calorie": 2000.0, "carbs": 260, "protein": 90, "fat": 71}, {"name": "Vegetarian Style Diet", "calorie": 2100.0, "carbs": 273, "protein": 95, "fat": 75}, {"name": "Vegetarian Style Diet", "calorie": 2200.0, "carbs": 286, "protein": 99, "fat": 78}, {"name": "Vegetarian Style Diet", "calorie": 2300.0, "carbs": 299, "protein": 104, "fat": 82}, {"name": "Vegetarian Style Diet", "calorie": 2400.0, "carbs": 312, "protein": 108, "fat": 85}, {"name": "Vegetarian Style Diet", "calorie": 2500.0, "carbs": 325, "protein": 113, "fat": 89}, {"name": "Vegetarian Style Diet", "calorie": 1000.0, "carbs": 138, "protein": 35, "fat": 38}, {"name": "Vegetarian Style Diet", "calorie": 1100.0, "carbs": 151, "protein": 39, "fat": 42}, {"name": "Vegetarian Style Diet", "calorie": 1200.0, "carbs": 165, "protein": 42, "fat": 45}, {"name": "Vegetarian Style Diet", "calorie": 1300.0, "carbs": 179, "protein": 46, "fat": 49}, {"name": "Vegetarian Style Diet", "calorie": 1400.0, "carbs": 193, "protein": 49, "fat": 53}, {"name": "Vegetarian Style Diet", "calorie": 1500.0, "carbs": 206, "protein": 53, "fat": 57}, {"name": "Vegetarian Style Diet", "calorie": 1600.0, "carbs": 220, "protein": 56, "fat": 60}, {"name": "Vegetarian Style Diet", "calorie": 1700.0, "carbs": 234, "protein": 60, "fat": 64}, {"name": "Vegetarian Style Diet", "calorie": 1800.0, "carbs": 248, "protein": 63, "fat": 68}, {"name": "Vegetarian Style Diet", "calorie": 1900.0, "carbs": 261, "protein": 67, "fat": 72}, {"name": "Vegetarian Style Diet", "calorie": 2000.0, "carbs": 275, "protein": 70, "fat": 76}, {"name": "Vegetarian Style Diet", "calorie": 2100.0, "carbs": 289, "protein": 74, "fat": 79}, {"name": "Vegetarian Style Diet", "calorie": 2200.0, "carbs": 303, "protein": 77, "fat": 83}, {"name": "Vegetarian Style Diet", "calorie": 2300.0, "carbs": 316, "protein": 81, "fat": 87}, {"name": "Vegetarian Style Diet", "calorie": 2400.0, "carbs": 330, "protein": 84, "fat": 91}, {"name": "Vegetarian Style Diet", "calorie": 2500.0, "carbs": 344, "protein": 88, "fat": 94}, {"name": "40 30 30 Style Diet", "calorie": 1000.0, "carbs": 100, "protein": 75, "fat": 33}, {"name": "40 30 30 Style Diet", "calorie": 1100.0, "carbs": 110, "protein": 83, "fat": 37}, {"name": "40 30 30 Style Diet", "calorie": 1200.0, "carbs": 120, "protein": 90, "fat": 40}, {"name": "40 30 30 Style Diet", "calorie": 1300.0, "carbs": 130, "protein": 98, "fat": 43}, {"name": "40 30 30 Style Diet", "calorie": 1400.0, "carbs": 140, "protein": 105, "fat": 47}, {"name": "40 30 30 Style Diet", "calorie": 1500.0, "carbs": 150, "protein": 113, "fat": 50}, {"name": "40 30 30 Style Diet", "calorie": 1600.0, "carbs": 160, "protein": 120, "fat": 53}, {"name": "40 30 30 Style Diet", "calorie": 1700.0, "carbs": 170, "protein": 128, "fat": 57}, {"name": "40 30 30 Style Diet", "calorie": 1800.0, "carbs": 180, "protein": 135, "fat": 60}, {"name": "40 30 30 Style Diet", "calorie": 1900.0, "carbs": 190, "protein": 143, "fat": 63}, {"name": "40 30 30 Style Diet", "calorie": 2000.0, "carbs": 200, "protein": 150, "fat": 67}, {"name": "40 30 30 Style Diet", "calorie": 2100.0, "carbs": 210, "protein": 158, "fat": 70}, {"name": "40 30 30 Style Diet", "calorie": 2200.0, "carbs": 220, "protein": 165, "fat": 73}, {"name": "40 30 30 Style Diet", "calorie": 2300.0, "carbs": 230, "protein": 173, "fat": 77}, {"name": "40 30 30 Style Diet", "calorie": 2400.0, "carbs": 240, "protein": 180, "fat": 80}, {"name": "40 30 30 Style Diet", "calorie": 2500.0, "carbs": 250, "protein": 188, "fat": 83}]);

db.infos.insertOne({
    "age": "16",
    "email": "daoduylam2020@gmail.com",
    "favorite": [
        {
            "category": "Milk, reduced fat",
            "description": "Milk, NFS",
            "portion": 1
        },
        {
            "category": "Pudding",
            "description": "Custard",
            "portion": 1
        }
    ],
    "first_name": "Lam",
    "gender": "male",
    "goal": {
        "calories": "3000",
        "carbs": "100",
        "fat": "100",
        "protein": "100"
    },
    "height": [
        "170",
        "cm"
    ],
    "history": {
        "28/05/2025": [
            {
                "amount": "2",
                "category": "Milk, reduced fat",
                "description": "Milk, reduced fat (2%)",
                "portion": 1
            },
            {
                "amount": "1",
                "category": "Milk, reduced fat",
                "description": "Milk, NFS",
                "portion": 1
            }
        ]
    },
    "last_name": "Dao",
    "user_id": "daoduylam",
    "username": "daoduylam",
    "weight": [
        "60",
        "kg"
    ]
});

db.users.insertOne({
    "user_id": ["daoduylam"],
    "username": "daoduylam",
    "password": Binary.createFromBase64("3DJ3JDEyJE3XlK9uI282TXLYNHab0ZFaTM4R69WYudQbV16bEpjNGFtdnpH5VdDeRWn8NluYkDRWVpt", 0)
});

db.foods.insertMany([{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09bb"
  },
  "description": "Pizza, cheese and vegetables, whole wheat thin crust",
  "category": "Pizza",
  "portion": {
    "1 piece, NFS": 133,
    "1 piece, small pizza": 89,
    "1 piece, medium pizza": 97,
    "1 piece, large pizza": 133,
    "1 piece, extra-large pizza": 133,
    "1 personal size pizza (5-7\" diameter)": 191,
    "1 small pizza (8-10\" diameter)": 536,
    "1 medium pizza (11-12\" diameter)": 775,
    "1 large pizza (13-15\" diameter)": 1066,
    "1 extra-large pizza (16-18\" diameter)": 1326,
    "1 surface inch": 6.9,
    "Quantity not specified": 266
  },
  "nutrient_per_100g": {
    "SFA 14:0": [
      0.4,
      "G"
    ],
    "PUFA 20:4": [
      0.007,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "MUFA 20:1": [
      0.026,
      "G"
    ],
    "SFA 12:0": [
      0.123,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      1.261,
      "G"
    ],
    "PUFA 18:2": [
      1.161,
      "G"
    ],
    "MUFA 16:1": [
      0.128,
      "G"
    ],
    "MUFA 18:1": [
      4.54,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      4.629,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0.003,
      "G"
    ],
    "SFA 6:0": [
      0.07,
      "G"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "PUFA 18:3": [
      0.113,
      "G"
    ],
    "SFA 10:0": [
      0.108,
      "G"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "SFA 18:0": [
      0.628,
      "G"
    ],
    "SFA 16:0": [
      1.926,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.002,
      "G"
    ],
    "SFA 8:0": [
      0.045,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0.1,
      "UG"
    ],
    "Zinc, Zn": [
      1.43,
      "MG"
    ],
    "Protein": [
      9.61,
      "G"
    ],
    "Potassium, K": [
      184,
      "MG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      1.6,
      "MG"
    ],
    "Energy": [
      226,
      "KCAL"
    ],
    "Carotene, beta": [
      81,
      "UG"
    ],
    "Thiamin": [
      0.207,
      "MG"
    ],
    "Total lipid (fat)": [
      10.64,
      "G"
    ],
    "Calcium, Ca": [
      200,
      "MG"
    ],
    "Iron, Fe": [
      2.38,
      "MG"
    ],
    "Folate, DFE": [
      63,
      "UG"
    ],
    "Retinol": [
      43,
      "UG"
    ],
    "Vitamin B-6": [
      0.155,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      5.1,
      "MG"
    ],
    "Selenium, Se": [
      15.7,
      "UG"
    ],
    "Folate, total": [
      45,
      "UG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Total Sugars": [
      3.4,
      "G"
    ],
    "Cryptoxanthin, beta": [
      1,
      "UG"
    ],
    "Riboflavin": [
      0.233,
      "MG"
    ],
    "Niacin": [
      2.847,
      "MG"
    ],
    "Carotene, alpha": [
      2,
      "UG"
    ],
    "Water": [
      53.11,
      "G"
    ],
    "Fiber, total dietary": [
      3.1,
      "G"
    ],
    "Lycopene": [
      1601,
      "UG"
    ],
    "Fatty acids, total saturated": [
      3.521,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Phosphorus, P": [
      199,
      "MG"
    ],
    "Vitamin A, RAE": [
      49,
      "UG"
    ],
    "Cholesterol": [
      14,
      "MG"
    ],
    "Vitamin K (phylloquinone)": [
      5.1,
      "UG"
    ],
    "Vitamin B-12": [
      0.19,
      "UG"
    ],
    "SFA 4:0": [
      0.086,
      "G"
    ],
    "Sodium, Na": [
      483,
      "MG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "Magnesium, Mg": [
      45,
      "MG"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Folic acid": [
      25,
      "UG"
    ],
    "Copper, Cu": [
      0.131,
      "MG"
    ],
    "Choline, total": [
      14.2,
      "MG"
    ],
    "Carbohydrate, by difference": [
      24.39,
      "G"
    ],
    "Lutein + zeaxanthin": [
      114,
      "UG"
    ],
    "Folate, food": [
      44,
      "UG"
    ]
  },
  "name": "Pizza",
  "image_url": "https://i.ibb.co/3ybCPVBv/pepperoni-pizza.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09bc"
  },
  "description": "Muffin, chocolate",
  "category": "Biscuits, muffins, quick breads",
  "portion": {
    "Quantity not specified": 130,
    "1 miniature": 25,
    "1 small": 70,
    "1 medium": 130,
    "1 large": 180,
    "1 bite size": 10
  },
  "nutrient_per_100g": {
    "Riboflavin": [
      0.21,
      "MG"
    ],
    "PUFA 18:3": [
      0.588,
      "G"
    ],
    "MUFA 16:1": [
      0.089,
      "G"
    ],
    "Folate, total": [
      41,
      "UG"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Potassium, K": [
      178,
      "MG"
    ],
    "MUFA 20:1": [
      0.089,
      "G"
    ],
    "Cholesterol": [
      51,
      "MG"
    ],
    "Calcium, Ca": [
      163,
      "MG"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Selenium, Se": [
      9.5,
      "UG"
    ],
    "Zinc, Zn": [
      1.12,
      "MG"
    ],
    "Water": [
      21.56,
      "G"
    ],
    "SFA 14:0": [
      0.07,
      "G"
    ],
    "Phosphorus, P": [
      144,
      "MG"
    ],
    "Copper, Cu": [
      0.268,
      "MG"
    ],
    "Fatty acids, total polyunsaturated": [
      5.471,
      "G"
    ],
    "Carotene, beta": [
      1,
      "UG"
    ],
    "Protein": [
      6.54,
      "G"
    ],
    "Vitamin B-12": [
      0.18,
      "UG"
    ],
    "Vitamin C, total ascorbic acid": [
      0,
      "MG"
    ],
    "Total lipid (fat)": [
      18.75,
      "G"
    ],
    "Thiamin": [
      0.248,
      "MG"
    ],
    "MUFA 18:1": [
      6.997,
      "G"
    ],
    "SFA 16:0": [
      2.611,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "SFA 10:0": [
      0.016,
      "G"
    ],
    "Retinol": [
      37,
      "UG"
    ],
    "SFA 4:0": [
      0.013,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "SFA 12:0": [
      0.018,
      "G"
    ],
    "Cryptoxanthin, beta": [
      2,
      "UG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      2.66,
      "MG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Niacin": [
      1.909,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      66,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      7.176,
      "G"
    ],
    "Magnesium, Mg": [
      36,
      "MG"
    ],
    "Folate, food": [
      13,
      "UG"
    ],
    "Carbohydrate, by difference": [
      50.94,
      "G"
    ],
    "Iron, Fe": [
      3.31,
      "MG"
    ],
    "Energy": [
      395,
      "KCAL"
    ],
    "Vitamin D (D2 + D3)": [
      0.6,
      "UG"
    ],
    "Fatty acids, total saturated": [
      4.653,
      "G"
    ],
    "Total Sugars": [
      25.98,
      "G"
    ],
    "Fiber, total dietary": [
      1.9,
      "G"
    ],
    "Folic acid": [
      28,
      "UG"
    ],
    "PUFA 18:2": [
      4.841,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Vitamin B-6": [
      0.046,
      "MG"
    ],
    "PUFA 20:4": [
      0.001,
      "G"
    ],
    "SFA 6:0": [
      0.01,
      "G"
    ],
    "Sodium, Na": [
      339,
      "MG"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Choline, total": [
      41.4,
      "MG"
    ],
    "Theobromine": [
      86,
      "MG"
    ],
    "SFA 18:0": [
      1.738,
      "G"
    ],
    "SFA 8:0": [
      0.007,
      "G"
    ],
    "Caffeine": [
      5,
      "MG"
    ],
    "Vitamin A, RAE": [
      37,
      "UG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Folate, DFE": [
      61,
      "UG"
    ],
    "Vitamin K (phylloquinone)": [
      13.9,
      "UG"
    ]
  },
  "name": "Muffin",
  "image_url": "https://i.ibb.co/FqVCNmpp/muffin.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09bd"
  },
  "description": "Cheeseburger, from fast food, 1 large patty",
  "category": "Burgers",
  "portion": {
    "1 cheeseburger": 210,
    "Quantity not specified": 210
  },
  "nutrient_per_100g": {
    "Protein": [
      18.74,
      "G"
    ],
    "SFA 6:0": [
      0.072,
      "G"
    ],
    "SFA 14:0": [
      0.793,
      "G"
    ],
    "SFA 4:0": [
      0.093,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      1.04,
      "G"
    ],
    "Vitamin B-12": [
      1.76,
      "UG"
    ],
    "SFA 18:0": [
      2.045,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Folic acid": [
      15,
      "UG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.19,
      "MG"
    ],
    "Vitamin A, RAE": [
      41,
      "UG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "SFA 16:0": [
      4.05,
      "G"
    ],
    "PUFA 18:2": [
      0.934,
      "G"
    ],
    "Vitamin C, total ascorbic acid": [
      0.4,
      "MG"
    ],
    "Total Sugars": [
      2.53,
      "G"
    ],
    "Folate, total": [
      41,
      "UG"
    ],
    "Copper, Cu": [
      0.079,
      "MG"
    ],
    "Vitamin K (phylloquinone)": [
      3.1,
      "UG"
    ],
    "Potassium, K": [
      228,
      "MG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.003,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Phosphorus, P": [
      215,
      "MG"
    ],
    "PUFA 20:4": [
      0.006,
      "G"
    ],
    "Cholesterol": [
      60,
      "MG"
    ],
    "Selenium, Se": [
      23.2,
      "UG"
    ],
    "Vitamin B-6": [
      0.272,
      "MG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Folate, food": [
      26,
      "UG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Total lipid (fat)": [
      17.61,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Riboflavin": [
      0.24,
      "MG"
    ],
    "Carotene, beta": [
      12,
      "UG"
    ],
    "Iron, Fe": [
      2.4,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      5,
      "UG"
    ],
    "MUFA 20:1": [
      0.037,
      "G"
    ],
    "Carbohydrate, by difference": [
      15.26,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      6.387,
      "G"
    ],
    "Magnesium, Mg": [
      22,
      "MG"
    ],
    "Folate, DFE": [
      52,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0.001,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0.7,
      "UG"
    ],
    "Zinc, Zn": [
      3.37,
      "MG"
    ],
    "SFA 12:0": [
      0.128,
      "G"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Choline, total": [
      49,
      "MG"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Cryptoxanthin, beta": [
      1,
      "UG"
    ],
    "Energy": [
      299,
      "KCAL"
    ],
    "PUFA 18:3": [
      0.097,
      "G"
    ],
    "MUFA 18:1": [
      5.854,
      "G"
    ],
    "Fiber, total dietary": [
      0.5,
      "G"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Water": [
      46.1,
      "G"
    ],
    "Calcium, Ca": [
      187,
      "MG"
    ],
    "SFA 10:0": [
      0.109,
      "G"
    ],
    "SFA 8:0": [
      0.046,
      "G"
    ],
    "MUFA 16:1": [
      0.46,
      "G"
    ],
    "Retinol": [
      40,
      "UG"
    ],
    "Thiamin": [
      0.178,
      "MG"
    ],
    "Fatty acids, total saturated": [
      7.64,
      "G"
    ],
    "Niacin": [
      4.163,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0.011,
      "G"
    ],
    "Sodium, Na": [
      453,
      "MG"
    ]
  },
  "name": "Cheese Burger",
  "image_url": "https://i.ibb.co/Q3NfBMyV/hamburger.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09be"
  },
  "description": "Cookie, butter or sugar, with icing or filling other than chocolate",
  "category": "Cookies and brownies",
  "portion": {
    "1 miniature/bite size": 7,
    "1 small": 28,
    "1 medium": 42,
    "1 large": 63,
    "Quantity not specified": 42
  },
  "nutrient_per_100g": {
    "Magnesium, Mg": [
      7,
      "MG"
    ],
    "Carotene, beta": [
      64,
      "UG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Folic acid": [
      37,
      "UG"
    ],
    "Folate, food": [
      3,
      "UG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "PUFA 18:4": [
      0.001,
      "G"
    ],
    "Calcium, Ca": [
      21,
      "MG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      0,
      "MG"
    ],
    "Folate, total": [
      41,
      "UG"
    ],
    "Zinc, Zn": [
      0.22,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Vitamin B-6": [
      0.229,
      "MG"
    ],
    "SFA 18:0": [
      1.55,
      "G"
    ],
    "MUFA 16:1": [
      0.229,
      "G"
    ],
    "Niacin": [
      1.712,
      "MG"
    ],
    "SFA 4:0": [
      0.294,
      "G"
    ],
    "Vitamin B-12": [
      0.21,
      "UG"
    ],
    "Total Sugars": [
      45.92,
      "G"
    ],
    "Potassium, K": [
      67,
      "MG"
    ],
    "PUFA 20:4": [
      0.012,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      8.3,
      "UG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Cholesterol": [
      63,
      "MG"
    ],
    "SFA 14:0": [
      0.925,
      "G"
    ],
    "Riboflavin": [
      0.192,
      "MG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      1.65,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      12,
      "UG"
    ],
    "Folate, DFE": [
      67,
      "UG"
    ],
    "Vitamin D (D2 + D3)": [
      0.5,
      "UG"
    ],
    "Total lipid (fat)": [
      14.93,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      2.445,
      "G"
    ],
    "Fiber, total dietary": [
      0.4,
      "G"
    ],
    "SFA 16:0": [
      3.12,
      "G"
    ],
    "SFA 10:0": [
      0.231,
      "G"
    ],
    "Sodium, Na": [
      204,
      "MG"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Thiamin": [
      0.2,
      "MG"
    ],
    "Iron, Fe": [
      1.21,
      "MG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.006,
      "G"
    ],
    "Phosphorus, P": [
      59,
      "MG"
    ],
    "SFA 6:0": [
      0.174,
      "G"
    ],
    "Water": [
      7.99,
      "G"
    ],
    "Carbohydrate, by difference": [
      72.7,
      "G"
    ],
    "Cryptoxanthin, beta": [
      1,
      "UG"
    ],
    "MUFA 20:1": [
      0.016,
      "G"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Fatty acids, total monounsaturated": [
      4.76,
      "G"
    ],
    "Fatty acids, total saturated": [
      6.9,
      "G"
    ],
    "Vitamin A, RAE": [
      151,
      "UG"
    ],
    "MUFA 18:1": [
      4.378,
      "G"
    ],
    "PUFA 18:2": [
      2.095,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Energy": [
      433,
      "KCAL"
    ],
    "Selenium, Se": [
      4.8,
      "UG"
    ],
    "Protein": [
      3.38,
      "G"
    ],
    "PUFA 18:3": [
      0.325,
      "G"
    ],
    "Copper, Cu": [
      0.11,
      "MG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0.004,
      "G"
    ],
    "SFA 12:0": [
      0.266,
      "G"
    ],
    "Choline, total": [
      4.8,
      "MG"
    ],
    "SFA 8:0": [
      0.102,
      "G"
    ],
    "Retinol": [
      145,
      "UG"
    ]
  },
  "name": "Cookie",
  "image_url": "https://i.ibb.co/yc63sMNX/icons8-cookies-100.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09bf"
  },
  "description": "Ice cream cone, vanilla, prepackaged",
  "category": "Ice cream and frozen dairy desserts",
  "portion": {
    "1 cone": 95,
    "Quantity not specified": 95
  },
  "nutrient_per_100g": {
    "SFA 12:0": [
      0.254,
      "G"
    ],
    "Copper, Cu": [
      0.128,
      "MG"
    ],
    "MUFA 16:1": [
      0.185,
      "G"
    ],
    "Calcium, Ca": [
      63,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      4,
      "UG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Phosphorus, P": [
      108,
      "MG"
    ],
    "Potassium, K": [
      222,
      "MG"
    ],
    "Protein": [
      5.21,
      "G"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Riboflavin": [
      0.252,
      "MG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "SFA 8:0": [
      0.148,
      "G"
    ],
    "Carbohydrate, by difference": [
      34.38,
      "G"
    ],
    "Magnesium, Mg": [
      29,
      "MG"
    ],
    "Caffeine": [
      7,
      "MG"
    ],
    "Fatty acids, total polyunsaturated": [
      1.657,
      "G"
    ],
    "Folate, DFE": [
      35,
      "UG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Vitamin C, total ascorbic acid": [
      0,
      "MG"
    ],
    "Fatty acids, total monounsaturated": [
      7.34,
      "G"
    ],
    "Folic acid": [
      16,
      "UG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "SFA 16:0": [
      4.933,
      "G"
    ],
    "Thiamin": [
      0.108,
      "MG"
    ],
    "SFA 18:0": [
      4.204,
      "G"
    ],
    "Theobromine": [
      56,
      "MG"
    ],
    "Iron, Fe": [
      0,
      "MG"
    ],
    "Energy": [
      354,
      "KCAL"
    ],
    "SFA 14:0": [
      0.948,
      "G"
    ],
    "Fatty acids, total saturated": [
      11.458,
      "G"
    ],
    "Sodium, Na": [
      94,
      "MG"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Selenium, Se": [
      2.6,
      "UG"
    ],
    "Folate, total": [
      24,
      "UG"
    ],
    "MUFA 20:1": [
      0.014,
      "G"
    ],
    "Vitamin A, RAE": [
      32,
      "UG"
    ],
    "Vitamin B-6": [
      0.046,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0.1,
      "UG"
    ],
    "Total Sugars": [
      25,
      "G"
    ],
    "Cholesterol": [
      21,
      "MG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.18,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Retinol": [
      31,
      "UG"
    ],
    "Fiber, total dietary": [
      1,
      "G"
    ],
    "PUFA 18:2": [
      1.408,
      "G"
    ],
    "Niacin": [
      0.829,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "MUFA 18:1": [
      7.14,
      "G"
    ],
    "SFA 4:0": [
      0.281,
      "G"
    ],
    "PUFA 18:3": [
      0.249,
      "G"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Vitamin B-12": [
      0.36,
      "UG"
    ],
    "Carotene, beta": [
      11,
      "UG"
    ],
    "Choline, total": [
      23.8,
      "MG"
    ],
    "SFA 10:0": [
      0.235,
      "G"
    ],
    "Water": [
      37.43,
      "G"
    ],
    "SFA 6:0": [
      0.197,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      1.1,
      "UG"
    ],
    "Total lipid (fat)": [
      21.88,
      "G"
    ],
    "Folate, food": [
      8,
      "UG"
    ],
    "Zinc, Zn": [
      0.86,
      "MG"
    ]
  },
  "name": "Ice Cream",
  "image_url": "https://i.ibb.co/dJ1X0J1y/icons8-ice-cream-cone-100.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c0"
  },
  "description": "Popcorn, movie theater, with added butter",
  "category": "Popcorn",
  "portion": {
    "1 kids size order": 84,
    "1 small order": 112,
    "1 medium order": 182,
    "1 large order": 238,
    "1 extra large order": 280,
    "1 order, NS as to size": 182,
    "1 cup": 14,
    "1 kernel": 0.2,
    "Quantity not specified": 35
  },
  "nutrient_per_100g": {
    "Fatty acids, total saturated": [
      35.476,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      11.656,
      "G"
    ],
    "Phosphorus, P": [
      137,
      "MG"
    ],
    "Water": [
      1.6,
      "G"
    ],
    "Total lipid (fat)": [
      58.78,
      "G"
    ],
    "Carbohydrate, by difference": [
      31.65,
      "G"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Vitamin B-6": [
      0.115,
      "MG"
    ],
    "SFA 16:0": [
      9.345,
      "G"
    ],
    "SFA 10:0": [
      1.811,
      "G"
    ],
    "Carotene, beta": [
      77,
      "UG"
    ],
    "SFA 8:0": [
      2.067,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      4.2,
      "UG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Folate, food": [
      9,
      "UG"
    ],
    "Cholesterol": [
      52,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Copper, Cu": [
      0.121,
      "MG"
    ],
    "Total Sugars": [
      0.29,
      "G"
    ],
    "Choline, total": [
      13.3,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "SFA 14:0": [
      5.957,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Potassium, K": [
      124,
      "MG"
    ],
    "Magnesium, Mg": [
      59,
      "MG"
    ],
    "SFA 6:0": [
      0.562,
      "G"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "Protein": [
      4.96,
      "G"
    ],
    "Iron, Fe": [
      1.55,
      "MG"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "SFA 18:0": [
      3.67,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      8.451,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      1.91,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      0.2,
      "MG"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "PUFA 18:2": [
      7.728,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Retinol": [
      167,
      "UG"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Niacin": [
      0.845,
      "MG"
    ],
    "Carotene, alpha": [
      25,
      "UG"
    ],
    "Zinc, Zn": [
      1.45,
      "MG"
    ],
    "Energy": [
      656,
      "KCAL"
    ],
    "Thiamin": [
      0.071,
      "MG"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "PUFA 18:3": [
      0.723,
      "G"
    ],
    "MUFA 16:1": [
      0.483,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "MUFA 18:1": [
      10.873,
      "G"
    ],
    "Vitamin A, RAE": [
      174,
      "UG"
    ],
    "Calcium, Ca": [
      8,
      "MG"
    ],
    "SFA 4:0": [
      0.667,
      "G"
    ],
    "Riboflavin": [
      0.077,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      592,
      "UG"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Fiber, total dietary": [
      5.4,
      "G"
    ],
    "Sodium, Na": [
      756,
      "MG"
    ],
    "SFA 12:0": [
      10.95,
      "G"
    ],
    "Selenium, Se": [
      4,
      "UG"
    ],
    "Folate, total": [
      9,
      "UG"
    ],
    "Folate, DFE": [
      9,
      "UG"
    ]
  },
  "name": "Popcorn",
  "image_url": "https://i.ibb.co/SD7nFjCz/icons8-popcorn-100.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c1"
  },
  "description": "Potato, french fries, from fresh, fried",
  "category": "French fries and other fried white potatoes",
  "portion": {
    "1 fry, NS as to shape": 5,
    "1 shoestring": 2,
    "1 straight cut": 5,
    "1 spiral or curly": 8,
    "1 waffle": 8,
    "1 wedge": 9,
    "1 crinkle cut": 5,
    "1 small, raw, yields": 50,
    "1 medium, raw, yields": 70,
    "1 large, raw, yields": 100,
    "1 cup": 60,
    "1 oz, raw, yields": 15,
    "Quantity not specified": 110
  },
  "nutrient_per_100g": {
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "PUFA 18:2": [
      4.452,
      "G"
    ],
    "PUFA 18:3": [
      0.578,
      "G"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Vitamin B-6": [
      0.265,
      "MG"
    ],
    "Folate, food": [
      16,
      "UG"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "Lutein + zeaxanthin": [
      13,
      "UG"
    ],
    "MUFA 20:1": [
      0.088,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "SFA 18:0": [
      0.378,
      "G"
    ],
    "Calcium, Ca": [
      9,
      "MG"
    ],
    "Iron, Fe": [
      0.64,
      "MG"
    ],
    "Choline, total": [
      12.7,
      "MG"
    ],
    "SFA 10:0": [
      0.001,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      2.5,
      "MG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      9.7,
      "MG"
    ],
    "Fiber, total dietary": [
      1.6,
      "G"
    ],
    "Riboflavin": [
      0.03,
      "MG"
    ],
    "Carotene, beta": [
      3,
      "UG"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "SFA 14:0": [
      0.007,
      "G"
    ],
    "Carbohydrate, by difference": [
      18.5,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Folate, total": [
      16,
      "UG"
    ],
    "Sodium, Na": [
      141,
      "MG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "SFA 16:0": [
      1.264,
      "G"
    ],
    "Total lipid (fat)": [
      13.1,
      "G"
    ],
    "Niacin": [
      1.215,
      "MG"
    ],
    "Vitamin A, RAE": [
      0,
      "UG"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Copper, Cu": [
      0.144,
      "MG"
    ],
    "SFA 12:0": [
      0.003,
      "G"
    ],
    "Energy": [
      198,
      "KCAL"
    ],
    "Vitamin K (phylloquinone)": [
      14.1,
      "UG"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "Fatty acids, total saturated": [
      1.763,
      "G"
    ],
    "Thiamin": [
      0.073,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Zinc, Zn": [
      0.28,
      "MG"
    ],
    "Water": [
      65.13,
      "G"
    ],
    "Protein": [
      1.93,
      "G"
    ],
    "Magnesium, Mg": [
      23,
      "MG"
    ],
    "Fatty acids, total polyunsaturated": [
      5.036,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      5.511,
      "G"
    ],
    "MUFA 16:1": [
      0.046,
      "G"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Phosphorus, P": [
      52,
      "MG"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "Total Sugars": [
      1.25,
      "G"
    ],
    "Folate, DFE": [
      16,
      "UG"
    ],
    "Potassium, K": [
      401,
      "MG"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "Selenium, Se": [
      0.3,
      "UG"
    ],
    "MUFA 18:1": [
      5.368,
      "G"
    ]
  },
  "name": "French Fries",
  "image_url": "https://i.ibb.co/hxfcB2w4/french-fries.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c2"
  },
  "description": "Tomatoes, raw",
  "category": "Tomatoes",
  "portion": {
    "1 slice": 20,
    "1 grape tomato": 8,
    "1 cherry": 17,
    "1 Italian tomato": 60,
    "1 plum tomato": 60,
    "1 whole": 125,
    "1 cup": 180,
    "Quantity not specified": 90
  },
  "nutrient_per_100g": {
    "Fatty acids, total polyunsaturated": [
      0.083,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      0.031,
      "G"
    ],
    "SFA 16:0": [
      0.02,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "Potassium, K": [
      226,
      "MG"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.58,
      "MG"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "MUFA 18:1": [
      0.03,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "Carotene, alpha": [
      61,
      "UG"
    ],
    "Phosphorus, P": [
      23,
      "MG"
    ],
    "PUFA 18:3": [
      0.003,
      "G"
    ],
    "Energy": [
      20,
      "KCAL"
    ],
    "Zinc, Zn": [
      0.15,
      "MG"
    ],
    "Carbohydrate, by difference": [
      4.04,
      "G"
    ],
    "Fatty acids, total saturated": [
      0.028,
      "G"
    ],
    "Sodium, Na": [
      4,
      "MG"
    ],
    "MUFA 16:1": [
      0.001,
      "G"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "Choline, total": [
      7,
      "MG"
    ],
    "Vitamin A, RAE": [
      32,
      "UG"
    ],
    "SFA 12:0": [
      0,
      "G"
    ],
    "SFA 14:0": [
      0,
      "G"
    ],
    "Lycopene": [
      2813,
      "UG"
    ],
    "Total lipid (fat)": [
      0.31,
      "G"
    ],
    "Riboflavin": [
      0.018,
      "MG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Carotene, beta": [
      397,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Water": [
      94.38,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Thiamin": [
      0.046,
      "MG"
    ],
    "SFA 18:0": [
      0.008,
      "G"
    ],
    "Protein": [
      0.82,
      "G"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      103,
      "UG"
    ],
    "Folate, food": [
      13,
      "UG"
    ],
    "Fiber, total dietary": [
      1.2,
      "G"
    ],
    "Total Sugars": [
      2.63,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Selenium, Se": [
      0,
      "UG"
    ],
    "Cryptoxanthin, beta": [
      6,
      "UG"
    ],
    "Iron, Fe": [
      0.22,
      "MG"
    ],
    "Copper, Cu": [
      0.051,
      "MG"
    ],
    "Calcium, Ca": [
      10,
      "MG"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "Folate, DFE": [
      13,
      "UG"
    ],
    "Vitamin C, total ascorbic acid": [
      16.3,
      "MG"
    ],
    "PUFA 18:2": [
      0.08,
      "G"
    ],
    "Folate, total": [
      13,
      "UG"
    ],
    "Vitamin B-6": [
      0.078,
      "MG"
    ],
    "Niacin": [
      0.597,
      "MG"
    ],
    "Magnesium, Mg": [
      10,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Vitamin K (phylloquinone)": [
      7.5,
      "UG"
    ],
    "SFA 10:0": [
      0,
      "G"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ]
  },
  "name": "Tomato",
  "image_url": "https://i.ibb.co/0RwXKV7c/tomato.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c3"
  },
  "description": "Pizza, extra cheese, thick crust",
  "category": "Pizza",
  "portion": {
    "1 piece, NFS": 141,
    "1 piece, small pizza": 94,
    "1 piece, medium pizza": 99,
    "1 piece, large pizza": 141,
    "1 piece, extra-large pizza": 145,
    "1 personal size pizza (5-7\" diameter)": 232,
    "1 small pizza (8-10\" diameter)": 565,
    "1 medium pizza (11-12\" diameter)": 792,
    "1 large pizza (13-15\" diameter)": 1112,
    "1 extra-large pizza (16-18\" diameter)": 1448,
    "1/2 bagel": 98,
    "1/2 English muffin": 58,
    "1 French bread": 154,
    "1 surface inch": 7.2,
    "Quantity not specified": 282
  },
  "nutrient_per_100g": {
    "Magnesium, Mg": [
      23,
      "MG"
    ],
    "Vitamin K (phylloquinone)": [
      9.6,
      "UG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Selenium, Se": [
      18.5,
      "UG"
    ],
    "Total Sugars": [
      3.27,
      "G"
    ],
    "Niacin": [
      3.336,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      2.658,
      "G"
    ],
    "Protein": [
      11.41,
      "G"
    ],
    "Potassium, K": [
      167,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0.004,
      "G"
    ],
    "PUFA 18:3": [
      0.298,
      "G"
    ],
    "Calcium, Ca": [
      203,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      21,
      "UG"
    ],
    "Retinol": [
      68,
      "UG"
    ],
    "Folate, food": [
      39,
      "UG"
    ],
    "PUFA 20:4": [
      0.012,
      "G"
    ],
    "SFA 4:0": [
      0.116,
      "G"
    ],
    "PUFA 18:4": [
      0.001,
      "G"
    ],
    "Vitamin C, total ascorbic acid": [
      1.1,
      "MG"
    ],
    "SFA 16:0": [
      2.255,
      "G"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Folic acid": [
      63,
      "UG"
    ],
    "Energy": [
      272,
      "KCAL"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "PUFA 18:2": [
      2.325,
      "G"
    ],
    "MUFA 18:1": [
      2.478,
      "G"
    ],
    "Total lipid (fat)": [
      11,
      "G"
    ],
    "Copper, Cu": [
      0.101,
      "MG"
    ],
    "SFA 14:0": [
      0.636,
      "G"
    ],
    "SFA 10:0": [
      0.156,
      "G"
    ],
    "SFA 6:0": [
      0.093,
      "G"
    ],
    "Water": [
      43.27,
      "G"
    ],
    "Vitamin B-12": [
      0.38,
      "UG"
    ],
    "Iron, Fe": [
      2.37,
      "MG"
    ],
    "Cholesterol": [
      19,
      "MG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.81,
      "MG"
    ],
    "Zinc, Zn": [
      1.38,
      "MG"
    ],
    "Phosphorus, P": [
      224,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Choline, total": [
      16.3,
      "MG"
    ],
    "Vitamin A, RAE": [
      75,
      "UG"
    ],
    "SFA 18:0": [
      0.903,
      "G"
    ],
    "Vitamin B-6": [
      0.06,
      "MG"
    ],
    "Fatty acids, total saturated": [
      4.576,
      "G"
    ],
    "Fiber, total dietary": [
      2.1,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "MUFA 20:1": [
      0.042,
      "G"
    ],
    "SFA 12:0": [
      0.187,
      "G"
    ],
    "Folate, DFE": [
      146,
      "UG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.004,
      "G"
    ],
    "MUFA 22:1": [
      0.002,
      "G"
    ],
    "Thiamin": [
      0.349,
      "MG"
    ],
    "Carotene, beta": [
      89,
      "UG"
    ],
    "Lycopene": [
      1837,
      "UG"
    ],
    "Riboflavin": [
      0.207,
      "MG"
    ],
    "MUFA 16:1": [
      0.124,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      2.691,
      "G"
    ],
    "Carbohydrate, by difference": [
      31.83,
      "G"
    ],
    "Folate, total": [
      102,
      "UG"
    ],
    "Sodium, Na": [
      547,
      "MG"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "SFA 8:0": [
      0.061,
      "G"
    ]
  },
  "name": "Cheese Pizza",
  "image_url": "https://i.ibb.co/3ybCPVBv/pepperoni-pizza.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c4"
  },
  "description": "Pizza with pepperoni, from restaurant or fast food, thin crust",
  "category": "Pizza",
  "portion": {
    "1 piece, NFS": 91,
    "1 piece, small pizza": 62,
    "1 piece, medium pizza": 66,
    "1 piece, large pizza": 91,
    "1 piece, extra-large pizza": 105,
    "1 personal size pizza (5-7\" diameter)": 133,
    "1 small pizza (8-10\" diameter)": 369,
    "1 medium pizza (11-12\" diameter)": 528,
    "1 large pizza (13-15\" diameter)": 728,
    "1 extra-large pizza (16-18\" diameter)": 1046,
    "1 surface inch": 4.9,
    "Quantity not specified": 182
  },
  "nutrient_per_100g": {
    "Carotene, beta": [
      94,
      "UG"
    ],
    "Selenium, Se": [
      23.6,
      "UG"
    ],
    "SFA 4:0": [
      0.086,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0.006,
      "G"
    ],
    "Riboflavin": [
      0.22,
      "MG"
    ],
    "Thiamin": [
      0.43,
      "MG"
    ],
    "PUFA 18:3": [
      0.188,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.87,
      "MG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0.001,
      "G"
    ],
    "MUFA 22:1": [
      0.014,
      "G"
    ],
    "PUFA 18:2": [
      1.798,
      "G"
    ],
    "Iron, Fe": [
      2.52,
      "MG"
    ],
    "Water": [
      41.77,
      "G"
    ],
    "Vitamin C, total ascorbic acid": [
      0.9,
      "MG"
    ],
    "Sodium, Na": [
      620,
      "MG"
    ],
    "Choline, total": [
      25.4,
      "MG"
    ],
    "Cholesterol": [
      25,
      "MG"
    ],
    "SFA 8:0": [
      0.047,
      "G"
    ],
    "Phosphorus, P": [
      198,
      "MG"
    ],
    "Fatty acids, total saturated": [
      5.092,
      "G"
    ],
    "Protein": [
      11.74,
      "G"
    ],
    "Zinc, Zn": [
      1.4,
      "MG"
    ],
    "PUFA 20:4": [
      0.022,
      "G"
    ],
    "Magnesium, Mg": [
      24,
      "MG"
    ],
    "Folate, DFE": [
      131,
      "UG"
    ],
    "MUFA 16:1": [
      0.186,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      3.853,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Carbohydrate, by difference": [
      31.98,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Folic acid": [
      56,
      "UG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Total Sugars": [
      3.26,
      "G"
    ],
    "Potassium, K": [
      195,
      "MG"
    ],
    "Calcium, Ca": [
      153,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Copper, Cu": [
      0.113,
      "MG"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "Retinol": [
      62,
      "UG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.004,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      6.4,
      "UG"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "MUFA 20:1": [
      0.063,
      "G"
    ],
    "Vitamin A, RAE": [
      70,
      "UG"
    ],
    "Total lipid (fat)": [
      11.91,
      "G"
    ],
    "MUFA 18:1": [
      3.511,
      "G"
    ],
    "Fiber, total dietary": [
      2.3,
      "G"
    ],
    "Folate, total": [
      92,
      "UG"
    ],
    "Lycopene": [
      1957,
      "UG"
    ],
    "Energy": [
      282,
      "KCAL"
    ],
    "SFA 14:0": [
      0.545,
      "G"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "Folate, food": [
      36,
      "UG"
    ],
    "SFA 18:0": [
      1.17,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      2.064,
      "G"
    ],
    "Lutein + zeaxanthin": [
      24,
      "UG"
    ],
    "SFA 10:0": [
      0.118,
      "G"
    ],
    "Niacin": [
      4.14,
      "MG"
    ],
    "SFA 16:0": [
      2.748,
      "G"
    ],
    "Vitamin B-6": [
      0.08,
      "MG"
    ],
    "Vitamin B-12": [
      0.5,
      "UG"
    ],
    "SFA 6:0": [
      0.068,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "SFA 12:0": [
      0.144,
      "G"
    ],
    "PUFA 18:4": [
      0.001,
      "G"
    ]
  },
  "name": "Pepperoni Pizza",
  "image_url": "https://i.ibb.co/3ybCPVBv/pepperoni-pizza.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c5"
  },
  "description": "Tiramisu",
  "category": "Cakes and pies",
  "portion": {
    "1 piece": 175,
    "1 cubic inch": 10,
    "1 cup": 145,
    "Quantity not specified": 175
  },
  "nutrient_per_100g": {
    "Niacin": [
      0.899,
      "MG"
    ],
    "Theobromine": [
      21,
      "MG"
    ],
    "Vitamin A, RAE": [
      185,
      "UG"
    ],
    "Caffeine": [
      34,
      "MG"
    ],
    "Cryptoxanthin, beta": [
      2,
      "UG"
    ],
    "Magnesium, Mg": [
      16,
      "MG"
    ],
    "Choline, total": [
      39,
      "MG"
    ],
    "MUFA 16:1": [
      0.481,
      "G"
    ],
    "SFA 6:0": [
      0.372,
      "G"
    ],
    "Total lipid (fat)": [
      23.86,
      "G"
    ],
    "Energy": [
      353,
      "KCAL"
    ],
    "MUFA 22:1": [
      0.002,
      "G"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "SFA 16:0": [
      6.361,
      "G"
    ],
    "Protein": [
      5.65,
      "G"
    ],
    "Carotene, beta": [
      6,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Lutein + zeaxanthin": [
      72,
      "UG"
    ],
    "MUFA 20:1": [
      0.047,
      "G"
    ],
    "PUFA 18:3": [
      0.09,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.71,
      "MG"
    ],
    "Zinc, Zn": [
      0.64,
      "MG"
    ],
    "Vitamin K (phylloquinone)": [
      1.7,
      "UG"
    ],
    "Folate, DFE": [
      24,
      "UG"
    ],
    "Vitamin B-6": [
      0.055,
      "MG"
    ],
    "Selenium, Se": [
      9.6,
      "UG"
    ],
    "SFA 12:0": [
      0.649,
      "G"
    ],
    "Riboflavin": [
      0.248,
      "MG"
    ],
    "Copper, Cu": [
      0.065,
      "MG"
    ],
    "SFA 10:0": [
      0.549,
      "G"
    ],
    "SFA 14:0": [
      2.058,
      "G"
    ],
    "Vitamin B-12": [
      0.2,
      "UG"
    ],
    "Fatty acids, total polyunsaturated": [
      1.319,
      "G"
    ],
    "Phosphorus, P": [
      109,
      "MG"
    ],
    "Potassium, K": [
      150,
      "MG"
    ],
    "Carotene, alpha": [
      2,
      "UG"
    ],
    "MUFA 18:1": [
      5.809,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Cholesterol": [
      121,
      "MG"
    ],
    "Total Sugars": [
      18.7,
      "G"
    ],
    "Carbohydrate, by difference": [
      29.44,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "PUFA 18:2": [
      0.77,
      "G"
    ],
    "PUFA 20:4": [
      0.07,
      "G"
    ],
    "SFA 8:0": [
      0.233,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0.012,
      "G"
    ],
    "Fiber, total dietary": [
      0.6,
      "G"
    ],
    "Folate, total": [
      20,
      "UG"
    ],
    "Sodium, Na": [
      173,
      "MG"
    ],
    "Calcium, Ca": [
      65,
      "MG"
    ],
    "Fatty acids, total saturated": [
      13.284,
      "G"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0.009,
      "G"
    ],
    "Vitamin C, total ascorbic acid": [
      1.1,
      "MG"
    ],
    "Folic acid": [
      6,
      "UG"
    ],
    "Fatty acids, total monounsaturated": [
      5.426,
      "G"
    ],
    "Folate, food": [
      14,
      "UG"
    ],
    "Thiamin": [
      0.097,
      "MG"
    ],
    "Water": [
      39.98,
      "G"
    ],
    "SFA 4:0": [
      0.449,
      "G"
    ],
    "SFA 18:0": [
      2.158,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0.6,
      "UG"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0.007,
      "G"
    ],
    "Retinol": [
      184,
      "UG"
    ],
    "Iron, Fe": [
      1.12,
      "MG"
    ]
  },
  "name": "Tiramisu",
  "image_url": "https://i.ibb.co/238bxPVz/tiramisu.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c6"
  },
  "description": "Kiwi fruit, raw",
  "category": "Other fruits and fruit salads",
  "portion": {
    "1 fruit": 75,
    "1 slice": 7,
    "1 cup": 180,
    "Quantity not specified": 75
  },
  "nutrient_per_100g": {
    "Sodium, Na": [
      5,
      "MG"
    ],
    "Water": [
      83.9,
      "G"
    ],
    "Cryptoxanthin, beta": [
      0,
      "UG"
    ],
    "Fiber, total dietary": [
      3,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      40.3,
      "UG"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "Lutein + zeaxanthin": [
      122,
      "UG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "Niacin": [
      0.37,
      "MG"
    ],
    "Carbohydrate, by difference": [
      14,
      "G"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "Vitamin E (alpha-tocopherol)": [
      1.3,
      "MG"
    ],
    "Folate, food": [
      26,
      "UG"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "Copper, Cu": [
      0.134,
      "MG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "PUFA 18:2": [
      0.246,
      "G"
    ],
    "Protein": [
      1.06,
      "G"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "SFA 14:0": [
      0,
      "G"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "SFA 18:0": [
      0.012,
      "G"
    ],
    "Energy": [
      64,
      "KCAL"
    ],
    "Riboflavin": [
      0.025,
      "MG"
    ],
    "Folate, DFE": [
      26,
      "UG"
    ],
    "Total Sugars": [
      8.99,
      "G"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "Folate, total": [
      26,
      "UG"
    ],
    "Total lipid (fat)": [
      0.44,
      "G"
    ],
    "SFA 12:0": [
      0,
      "G"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "Calcium, Ca": [
      35,
      "MG"
    ],
    "Fatty acids, total monounsaturated": [
      0.047,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      0.287,
      "G"
    ],
    "Fatty acids, total saturated": [
      0.029,
      "G"
    ],
    "Magnesium, Mg": [
      16,
      "MG"
    ],
    "Vitamin B-6": [
      0.061,
      "MG"
    ],
    "Choline, total": [
      7.8,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      74.7,
      "MG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "SFA 16:0": [
      0.017,
      "G"
    ],
    "Phosphorus, P": [
      34,
      "MG"
    ],
    "PUFA 18:3": [
      0.042,
      "G"
    ],
    "Iron, Fe": [
      0.24,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "SFA 10:0": [
      0,
      "G"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "MUFA 18:1": [
      0.047,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "Potassium, K": [
      198,
      "MG"
    ],
    "Thiamin": [
      0.027,
      "MG"
    ],
    "MUFA 16:1": [
      0,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Zinc, Zn": [
      0.14,
      "MG"
    ],
    "Vitamin A, RAE": [
      4,
      "UG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Selenium, Se": [
      0.2,
      "UG"
    ],
    "Carotene, beta": [
      52,
      "UG"
    ]
  },
  "name": "Kiwi",
  "image_url": "https://i.ibb.co/MDhzS3br/kiwi.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c7"
  },
  "description": "Watermelon, raw",
  "category": "Melons",
  "portion": {
    "1 cube": 15,
    "1 ball": 15,
    "1 cup": 155,
    "1 small wedge/slice": 218,
    "1 medium wedge/slice": 325,
    "1 large wedge/slice": 432,
    "1 miniature melon": 1300,
    "1 small melon": 3200,
    "1 medium melon": 5200,
    "1 large melon": 6000,
    "Quantity not specified": 78
  },
  "nutrient_per_100g": {
    "Vitamin E (alpha-tocopherol)": [
      0.05,
      "MG"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "Lutein + zeaxanthin": [
      8,
      "UG"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "Cryptoxanthin, beta": [
      78,
      "UG"
    ],
    "Lycopene": [
      4532,
      "UG"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Protein": [
      0.61,
      "G"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "Niacin": [
      0.178,
      "MG"
    ],
    "Potassium, K": [
      112,
      "MG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Water": [
      91.45,
      "G"
    ],
    "Vitamin B-6": [
      0.045,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      8.1,
      "MG"
    ],
    "Total lipid (fat)": [
      0.15,
      "G"
    ],
    "Zinc, Zn": [
      0.1,
      "MG"
    ],
    "Fiber, total dietary": [
      0.4,
      "G"
    ],
    "SFA 14:0": [
      0,
      "G"
    ],
    "Carbohydrate, by difference": [
      7.55,
      "G"
    ],
    "Phosphorus, P": [
      11,
      "MG"
    ],
    "Magnesium, Mg": [
      10,
      "MG"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "MUFA 18:1": [
      0.037,
      "G"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Folate, DFE": [
      3,
      "UG"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "Vitamin A, RAE": [
      28,
      "UG"
    ],
    "Selenium, Se": [
      0.4,
      "UG"
    ],
    "SFA 10:0": [
      0.001,
      "G"
    ],
    "Riboflavin": [
      0.021,
      "MG"
    ],
    "Fatty acids, total saturated": [
      0.016,
      "G"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "Sodium, Na": [
      1,
      "MG"
    ],
    "MUFA 16:1": [
      0,
      "G"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "SFA 18:0": [
      0.006,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Carotene, beta": [
      303,
      "UG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Energy": [
      30,
      "KCAL"
    ],
    "Iron, Fe": [
      0.24,
      "MG"
    ],
    "SFA 12:0": [
      0.001,
      "G"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "PUFA 18:2": [
      0.05,
      "G"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Calcium, Ca": [
      7,
      "MG"
    ],
    "Copper, Cu": [
      0.042,
      "MG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Folate, total": [
      3,
      "UG"
    ],
    "Thiamin": [
      0.033,
      "MG"
    ],
    "Folate, food": [
      3,
      "UG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Choline, total": [
      4.1,
      "MG"
    ],
    "PUFA 18:3": [
      0,
      "G"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "SFA 16:0": [
      0.008,
      "G"
    ],
    "Fatty acids, total monounsaturated": [
      0.037,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      0.1,
      "UG"
    ],
    "Total Sugars": [
      6.2,
      "G"
    ],
    "Fatty acids, total polyunsaturated": [
      0.05,
      "G"
    ]
  },
  "name": "Watermelon",
  "image_url": "https://i.ibb.co/TMXqtCcR/watermelom.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c8"
  },
  "description": "Apple, raw",
  "category": "Apples",
  "portion": {
    "1 small": 165,
    "1 medium": 200,
    "1 large": 242,
    "1 extra large": 295,
    "1 slice": 25,
    "1 cup": 125,
    "1 single serving package": 34,
    "Quantity not specified": 200
  },
  "nutrient_per_100g": {
    "Copper, Cu": [
      0.03,
      "MG"
    ],
    "Potassium, K": [
      104,
      "MG"
    ],
    "Lutein + zeaxanthin": [
      29,
      "UG"
    ],
    "Fatty acids, total saturated": [
      0.028,
      "G"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "MUFA 16:1": [
      0,
      "G"
    ],
    "PUFA 18:2": [
      0.043,
      "G"
    ],
    "Carbohydrate, by difference": [
      14.8,
      "G"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "SFA 10:0": [
      0,
      "G"
    ],
    "Iron, Fe": [
      0.03,
      "MG"
    ],
    "Phosphorus, P": [
      9,
      "MG"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "Thiamin": [
      0.01,
      "MG"
    ],
    "SFA 16:0": [
      0.024,
      "G"
    ],
    "Protein": [
      0.17,
      "G"
    ],
    "Vitamin A, RAE": [
      3,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Carotene, alpha": [
      0,
      "UG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.18,
      "MG"
    ],
    "MUFA 18:1": [
      0.007,
      "G"
    ],
    "Folate, total": [
      0,
      "UG"
    ],
    "Choline, total": [
      3.4,
      "MG"
    ],
    "Lycopene": [
      0,
      "UG"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "Fiber, total dietary": [
      2.1,
      "G"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "Folate, DFE": [
      0,
      "UG"
    ],
    "Vitamin C, total ascorbic acid": [
      4.6,
      "MG"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "Fatty acids, total polyunsaturated": [
      0.051,
      "G"
    ],
    "Sodium, Na": [
      0,
      "MG"
    ],
    "Folate, food": [
      0,
      "UG"
    ],
    "SFA 18:0": [
      0.003,
      "G"
    ],
    "Calcium, Ca": [
      5,
      "MG"
    ],
    "Cryptoxanthin, beta": [
      11,
      "UG"
    ],
    "Selenium, Se": [
      0,
      "UG"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "Carotene, beta": [
      27,
      "UG"
    ],
    "Fatty acids, total monounsaturated": [
      0.007,
      "G"
    ],
    "Riboflavin": [
      0.07,
      "MG"
    ],
    "Water": [
      84.62,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      2.2,
      "UG"
    ],
    "Total lipid (fat)": [
      0.15,
      "G"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "SFA 14:0": [
      0.001,
      "G"
    ],
    "Total Sugars": [
      12.08,
      "G"
    ],
    "Energy": [
      61,
      "KCAL"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Vitamin B-6": [
      0.03,
      "MG"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "PUFA 18:3": [
      0.009,
      "G"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Niacin": [
      0.091,
      "MG"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "SFA 12:0": [
      0,
      "G"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Magnesium, Mg": [
      5,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Zinc, Zn": [
      0.02,
      "MG"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ]
  },
  "name": "Apple",
  "image_url": "https://i.ibb.co/4Z82ZGmF/apple.png"
},
{
  "_id": {
    "$oid": "686b4c34e1aeb787a72a09c9"
  },
  "description": "Mango, raw",
  "category": "Mango and papaya",
  "portion": {
    "1 slice/chunk": 25,
    "1 mango": 210,
    "1 cup": 165,
    "Quantity not specified": 83
  },
  "nutrient_per_100g": {
    "Vitamin A, RAE": [
      54,
      "UG"
    ],
    "PUFA 22:6 n-3 (DHA)": [
      0,
      "G"
    ],
    "Lutein + zeaxanthin": [
      23,
      "UG"
    ],
    "MUFA 20:1": [
      0,
      "G"
    ],
    "Thiamin": [
      0.028,
      "MG"
    ],
    "Vitamin B-12, added": [
      0,
      "UG"
    ],
    "Fatty acids, total polyunsaturated": [
      0.071,
      "G"
    ],
    "PUFA 20:4": [
      0,
      "G"
    ],
    "SFA 18:0": [
      0.004,
      "G"
    ],
    "Cholesterol": [
      0,
      "MG"
    ],
    "Fiber, total dietary": [
      1.6,
      "G"
    ],
    "Folic acid": [
      0,
      "UG"
    ],
    "Carotene, alpha": [
      9,
      "UG"
    ],
    "PUFA 18:4": [
      0,
      "G"
    ],
    "Riboflavin": [
      0.038,
      "MG"
    ],
    "Total lipid (fat)": [
      0.38,
      "G"
    ],
    "Sodium, Na": [
      1,
      "MG"
    ],
    "Caffeine": [
      0,
      "MG"
    ],
    "Vitamin D (D2 + D3)": [
      0,
      "UG"
    ],
    "Choline, total": [
      7.6,
      "MG"
    ],
    "Retinol": [
      0,
      "UG"
    ],
    "Vitamin B-6": [
      0.119,
      "MG"
    ],
    "Protein": [
      0.82,
      "G"
    ],
    "Vitamin K (phylloquinone)": [
      4.2,
      "UG"
    ],
    "SFA 14:0": [
      0.013,
      "G"
    ],
    "Phosphorus, P": [
      14,
      "MG"
    ],
    "Iron, Fe": [
      0.16,
      "MG"
    ],
    "MUFA 18:1": [
      0.075,
      "G"
    ],
    "Total Sugars": [
      13.66,
      "G"
    ],
    "Fatty acids, total saturated": [
      0.092,
      "G"
    ],
    "PUFA 20:5 n-3 (EPA)": [
      0,
      "G"
    ],
    "SFA 4:0": [
      0,
      "G"
    ],
    "SFA 8:0": [
      0,
      "G"
    ],
    "Niacin": [
      0.669,
      "MG"
    ],
    "Selenium, Se": [
      0.6,
      "UG"
    ],
    "Folate, DFE": [
      43,
      "UG"
    ],
    "Vitamin E (alpha-tocopherol)": [
      0.9,
      "MG"
    ],
    "Folate, food": [
      43,
      "UG"
    ],
    "Carotene, beta": [
      640,
      "UG"
    ],
    "Cryptoxanthin, beta": [
      10,
      "UG"
    ],
    "Calcium, Ca": [
      11,
      "MG"
    ],
    "SFA 6:0": [
      0,
      "G"
    ],
    "Lycopene": [
      3,
      "UG"
    ],
    "MUFA 22:1": [
      0,
      "G"
    ],
    "PUFA 18:2": [
      0.019,
      "G"
    ],
    "Vitamin E, added": [
      0,
      "MG"
    ],
    "Vitamin C, total ascorbic acid": [
      36.4,
      "MG"
    ],
    "SFA 10:0": [
      0,
      "G"
    ],
    "Zinc, Zn": [
      0.09,
      "MG"
    ],
    "Potassium, K": [
      168,
      "MG"
    ],
    "PUFA 18:3": [
      0.051,
      "G"
    ],
    "Vitamin B-12": [
      0,
      "UG"
    ],
    "Fatty acids, total monounsaturated": [
      0.14,
      "G"
    ],
    "Magnesium, Mg": [
      10,
      "MG"
    ],
    "Alcohol, ethyl": [
      0,
      "G"
    ],
    "Water": [
      83.46,
      "G"
    ],
    "Theobromine": [
      0,
      "MG"
    ],
    "SFA 12:0": [
      0.001,
      "G"
    ],
    "Energy": [
      60,
      "KCAL"
    ],
    "PUFA 22:5 n-3 (DPA)": [
      0,
      "G"
    ],
    "Copper, Cu": [
      0.111,
      "MG"
    ],
    "SFA 16:0": [
      0.072,
      "G"
    ],
    "Carbohydrate, by difference": [
      14.98,
      "G"
    ],
    "Folate, total": [
      43,
      "UG"
    ],
    "MUFA 16:1": [
      0.067,
      "G"
    ]
  },
  "name": "Mango",
  "image_url": "https://i.ibb.co/cKSvW02C/mango.png"
}])