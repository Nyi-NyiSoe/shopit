import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource({required this.sharedPreferences});
  // Save user
  Future<void> saveUser(String userId) async {
    await sharedPreferences.setString('user', userId);
  }
// Get user
  Future<String?> getUser() async {
    return sharedPreferences.getString('user');
  }
// Delete user
  Future<void> deleteUser() async {
    await sharedPreferences.remove('user');
  }
}