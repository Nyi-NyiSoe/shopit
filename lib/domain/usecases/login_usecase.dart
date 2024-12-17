import 'package:shopit/data/models/user_model.dart';
import 'package:shopit/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<UserModel> login(String username, String password) async {
    return authRepository.login(username, password);
  }
}
