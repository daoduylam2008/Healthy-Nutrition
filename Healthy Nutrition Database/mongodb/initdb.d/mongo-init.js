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

db.createCollection("infos")
db.createCollection("users")

db.infos.insertOne({
    "user_id": ["daoduylam"],
    "username": "daoduylam",
    "last_name": "",
    "first_name": "",
    "email": "",
    "history": {},
    "height": "",
    "weight": "",
    "goal": "",
    "age": "",
    "favorite": []
})

db.users.insertOne({
    "user_id": ["daoduylam"],
    "username": "daoduylam",
    "password": Binary.createFromBase64("3DJ3JDEyJE3XlK9uI282TXLYNHab0ZFaTM4R69WYudQbV16bEpjNGFtdnpH5VdDeRWn8NluYkDRWVpt", 0)
})

