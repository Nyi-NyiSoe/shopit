import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/data/models/user_model.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _userKey = "user_data";

  AuthLocalDataSource({required this.sharedPreferences});
  // Save user
  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

// Delete user
  Future<void> deleteUser() async {
   final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
}
}