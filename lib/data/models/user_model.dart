import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/user.dart';

class UserModel extends User with EquatableMixin{
  final String id;
  final String name;
  final String email;
  final String password;
  final String avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  }):super(id: id, name: name, email: email, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  @override
  List<Object?> get props => [id, name, email, password, avatar];
}
