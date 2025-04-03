class Food {
  String id;
  String name;
  Map<String, dynamic> nutrients;
  bool favorite;

  Food(this.id, this.name, this.nutrients, this.favorite);
}

class User {
  String id;
  String username;
  String password;
  String? image;

  Map<String, List<Food>> history;

  User(this.id, this.username, this.password, this.history);
}

var nutrients = {"calories": 2000, "fat": 20, "proteins": 100};
Food foodExample_1 = Food("0001", "food_1", nutrients, false);
Food foodExample_2 = Food("0001", "food_2", nutrients, false);
Food foodExample_3 = Food("0001", "food_3", nutrients, true);

List<Food> foods = [foodExample_1, foodExample_2, foodExample_3];

final now = DateTime.now();
final today = "${now.day}/${now.month}/${now.year}";

var history = {today: foods};

User userExample = User("01", "daoduylam", "1234", history);
