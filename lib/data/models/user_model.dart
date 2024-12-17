import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/user.dart';

class UserModel extends User with EquatableMixin{
  final String id;
  final String fname;
  final String lname;
  final String username;
  final String email;
  final String password;
  final String avatar;

  UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.username,
    required this.email,
    required this.password,
    required this.avatar,
  }): super(
    id: id,
    fname: fname,
    lname: lname,
    username: username,
    email: email,
    password: password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'username': username,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  @override
  List<Object?> get props => [id, fname, lname, username, email, password, avatar];
}
