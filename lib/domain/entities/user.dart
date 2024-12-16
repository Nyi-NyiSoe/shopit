class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }
}
