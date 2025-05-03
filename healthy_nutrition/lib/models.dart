class User {
  final String user_id;
  final String username;
  final String password;

  // ignore: non_constant_identifier_names
  const User({
    required this.user_id,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'user_id': String user_id,
        'username': String username,
        'password': String password,
      } =>
        User(user_id: user_id, username: username, password: password),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class UserInfo {
  final List user_id;
  final String username;
  final String email;
  final Map<String, dynamic> history;
  final String height;
  final String weight;
  final String goal;
  final String lastName;
  final String firstName;
  final String age;
  final List<dynamic> favorite;

  const UserInfo({
    required this.user_id,
    required this.username,
    required this.email,
    required this.history,
    required this.height,
    required this.weight,
    required this.goal,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.favorite,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "user_id": List user_id,
        "username": String username,
        "email": String email,
        "history": Map<String, dynamic> history,
        "height": String height,
        "weight": String weight,
        "goal": String goal,
        "last_name": String lastName,
        "first_name": String firstName,
        "age": String age,
        "favorite": List<dynamic> favorite,
      } =>
        UserInfo(
          user_id: user_id,
          username: username,
          email: email,
          history: history,
          height: height,
          weight: weight,
          goal: goal,
          firstName: firstName,
          lastName: lastName,
          age: age,
          favorite: favorite,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class Food {
  final String name;
  final String measure;
  final double grams;
  final double calories;
  final double protein;
  final double fat;
  final double satFat;
  final double fiber;
  final double carbs;
  final String category;

  Food({
    required this.name,
    required this.measure,
    required this.grams,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.satFat,
    required this.fiber,
    required this.carbs,
    required this.category,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "Food": String name,
        "Measure": String measure,
        "Grams": double grams,
        "Calories": double calories,
        "Protein": double protein,
        "Fat": double fat,
        "Sat.Fat": double satFat,
        "Fiber": double fiber,
        "Carbs": double carbs,
        "Category": String category,
      } =>
        Food(
          name: name,
          measure: measure,
          grams: grams,
          calories: calories,
          protein: protein,
          fat: fat,
          satFat: satFat,
          fiber: fiber,
          carbs: carbs,
          category: category,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
