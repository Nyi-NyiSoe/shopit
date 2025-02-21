import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/core/configs/routing_service.dart';
import 'package:shopit/data/repository/auth_repo_impl/auth_repository_impl.dart';
import 'package:shopit/data/repository/data_repo_impl/data_repo_impl.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
import 'package:shopit/data/source/auth_repo/auth_remote_data_source.dart';
import 'package:shopit/data/source/data_repo/data_remote_data_source.dart';
import 'package:shopit/domain/usecases/data_usecase.dart';
import 'package:shopit/domain/usecases/login_usecase.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:shopit/presentation/bloc/data_bloc/category_cubit.dart';
import 'package:shopit/presentation/bloc/data_bloc/product_cubit.dart';
import 'package:shopit/presentation/bloc/theme_bloc/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load .env file
  await dotenv.load(fileName: ".env");
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  // Check if user is logged in
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences.containsKey('user');

  GoRouter router = RoutingService().router;

  // Create login usecase
  final loginUsecase = LoginUsecase(
    AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSource(),
      localDataSource:
          AuthLocalDataSource(sharedPreferences: sharedPreferences),
    ),
  );
  final dataUsecase =
      DataUsecase(DataRepoImpl(remoteDataSource: DataRemoteDataSource()));

      final localDataSource = AuthLocalDataSource(sharedPreferences: sharedPreferences);

  runApp(MyApp(
    themeCubit: themeCubit,
    isLoggedIn: isLoggedIn,
    loginUsecase: loginUsecase,
    dataUsecase: dataUsecase,
    router: router,
    localDataSource: localDataSource,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  final bool isLoggedIn;
  final loginUsecase;
  final dataUsecase;
  final GoRouter router;
  final localDataSource;
  const MyApp({
    super.key,
    required this.themeCubit,
    this.isLoggedIn = false,
    this.loginUsecase,
    this.dataUsecase,
    required this.router,
    this.localDataSource
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //theme cubit
        BlocProvider<ThemeCubit>.value(value: themeCubit),
        //auth bloc
        BlocProvider<AuthBloc>(
          create: (context){
            final authBloc = AuthBloc(loginUsecase, localDataSource);
            authBloc.add(AppStartedEvent());
            return authBloc;
          }
        ),

        BlocProvider<CategoryCubit>(
            create: (context) =>
                CategoryCubit(dataUsecase)..getCategoryModels()),
        BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(dataUsecase)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Shop It',
            theme: theme,
          );
        },
      ),
    );
  }
}
