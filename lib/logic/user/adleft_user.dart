class User {
  final String email;
  final String id;
  final String? username;
  final String password;

  User({
    required this.email,
    required this.id,
    this.username,
    required this.password,
  });
}
