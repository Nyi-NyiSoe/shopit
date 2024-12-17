abstract class User {
  final String id;
  final String fname;
  final String lname;
  final String username;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.username,
      required this.email,
      required this.password});

  @override
  String toString() {
    return 'User{id: $id, fname: $fname, lname: $lname, username: $username, email: $email, password: $password}';
  }
}
