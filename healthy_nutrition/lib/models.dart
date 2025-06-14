class User {
  // ignore: non_constant_identifier_names
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
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}

class UserInfo {
  // ignore: non_constant_identifier_names
  final String user_id;
  final String username;
  final String email;
  final Map<String, dynamic> history;
  final List height;
  final List weight;
  final String goal;
  final String lastName;
  final String firstName;
  final String age;
  final List<dynamic> favorite;
  final String gender;

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
    required this.gender,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "user_id": String user_id,
        "username": String username,
        "email": String email,
        "history": Map<String, dynamic> history,
        "height": List height,
        "weight": List weight,
        "goal": String goal,
        "last_name": String lastName,
        "first_name": String firstName,
        "age": String age,
        "favorite": List<dynamic> favorite,
        "gender": String gender,
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
          gender: gender
        ),
      _ => throw const FormatException('Failed to load user information.'),
    };
  }
}

class Food {
  final String description;
  final String category;
  final Map<String, dynamic> portion;
  final Map<String, dynamic> nutrients;

  Food({
    required this.category,
    required this.description,
    required this.nutrients,
    required this.portion
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "description": String description,
        "category": String category,
        "portion": Map<String, dynamic> portion,
        "nutrient_per_100g": Map<String, dynamic> nutrients,
      } =>
        Food(category: category, description: description, nutrients: nutrients, portion: portion),
      _ => throw const FormatException('Failed to load food.'),
    };
  }
}
