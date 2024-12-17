import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shopit/data/models/user_model.dart';


class AuthRemoteDataSource {
  final _loginURl = dotenv.env['LOGIN_URL'];
  final _signupURl = dotenv.env['SIGNUP_URL'];

  Future<UserModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(_loginURl!),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body);
      return UserModel.fromJson(jsonRes);
    } else {
      throw Exception('Failed to login');
    }
  }
}
