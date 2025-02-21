import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/core/configs/routing_service.dart';
import 'package:shopit/data/repository/auth_repo_impl/auth_repository_impl.dart';
import 'package:shopit/data/repository/data_repo_impl/data_repo_impl.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
import 'package:shopit/data/source/auth_repo/auth_remote_data_source.dart';
import 'package:shopit/data/source/data_repo/data_remote_data_source.dart';
import 'package:shopit/domain/repository/auth_repository.dart';
import 'package:shopit/domain/repository/data_repository.dart';
import 'package:shopit/domain/usecases/data_usecase.dart';
import 'package:shopit/domain/usecases/login_usecase.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  locator.registerLazySingleton<http.Client>(() => http.Client());

  locator.registerLazySingleton<GoRouter>(() => RoutingService().router);

  // Data sources
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(sharedPreferences: sharedPreferences));
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource());
  locator.registerFactory<DataRemoteDataSource>(() => DataRemoteDataSource());

  // Repositories
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: locator<AuthRemoteDataSource>(),
        localDataSource: locator<AuthLocalDataSource>(),
      ));
  locator.registerLazySingleton<DataRepository>(
      () => DataRepoImpl(remoteDataSource: locator<DataRemoteDataSource>()));

  // Usecases
  locator.registerLazySingleton<LoginUsecase>(() => LoginUsecase(
        AuthRepositoryImpl(
          remoteDataSource: locator<AuthRemoteDataSource>(),
          localDataSource: locator<AuthLocalDataSource>(),
        ),
      ));
  locator.registerSingleton<DataUsecase>(DataUsecase(locator<DataRepository>()));


}
