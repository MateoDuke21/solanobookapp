// user_data.dart
class User {
  String email;
  String password;

  User(this.email, this.password);
}

class UserData {
  static final List<User> _users = [];

  static List<User> get users => _users;

  static void addUser(String email, String password) {
    _users.add(User(email, password));
  }

  static User getUserByEmail(String email) {
  return _users.firstWhere(
    (user) => user.email == email,
    orElse: () => User('', ''), // Return a default user if not found
  );
}

  static bool authenticate(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }

  static void updatePassword(String email, String newPassword) {
  final user = getUserByEmail(email);
  // ignore: unnecessary_null_comparison
  if (user != null) {
    user.password = newPassword;
  } else {
    // Handle case where user is not found if needed
  }
}

}
