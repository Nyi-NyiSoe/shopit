import 'package:shopit/data/models/user_model.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
import 'package:shopit/data/source/auth_repo/auth_remote_data_source.dart';
import 'package:shopit/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource; //new final
  final AuthLocalDataSource localDataSource; //new final

  AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource}); //new constructor
  @override
  Future<UserModel> login(String username, String password) async {
    // TODO: implement login
    try {
      final user = await remoteDataSource.login(username, password);
      await localDataSource.saveUser(user.id.toString());
      return user;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await localDataSource.deleteUser();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserModel> signup(String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
