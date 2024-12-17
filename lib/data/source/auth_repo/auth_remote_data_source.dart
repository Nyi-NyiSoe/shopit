import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shopit/data/models/user_model.dart';

class AuthRemoteDataSource {
  final _loginURl = dotenv.env['LOGIN_URL'];
  final _signupURl = dotenv.env['SIGNUP_URL'];

  Future<UserModel> login(String username, String password) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(
      {
        'username': username,
        'password': password,
      },
    );
    final response = await http.post(
      Uri.parse(_loginURl!),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      print('success');
      final jsonRes = jsonDecode(response.body);
      return UserModel.fromJson(jsonRes['user']);
    } else {
      throw Exception('Failed to login');
    }
  }
}
