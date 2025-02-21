import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/user.dart';

class UserModel extends User with EquatableMixin {
  final String avatar;

  UserModel({
    required super.id,
    required super.fname,
    required super.lname,
    required super.username,
    required super.email,
    required super.password,
    required this.avatar,
  });

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
  List<Object?> get props =>
      [id, fname, lname, username, email, password, avatar];
}
