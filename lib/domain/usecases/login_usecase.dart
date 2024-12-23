import 'dart:developer';

import 'package:shopit/data/models/user_model.dart';
import 'package:shopit/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  // Login user
  Future<UserModel> login(String username, String password) async {
    return authRepository.login(username, password);
  }

  Future<void> logout() async {
    log('logging out');
    return authRepository.logout();
  }
}
