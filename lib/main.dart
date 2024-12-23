import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/data/repository/auth_repo_impl/auth_repository_impl.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
import 'package:shopit/data/source/auth_repo/auth_remote_data_source.dart';
import 'package:shopit/domain/usecases/login_usecase.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopit/presentation/bloc/theme_bloc/theme_cubit.dart';
import 'package:shopit/presentation/pages/login_page.dart';
import 'package:shopit/presentation/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load .env file
  await dotenv.load(fileName: ".env");
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  // Check if user is logged in
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences.containsKey('user');

  // Create login usecase
  final loginUsecase = LoginUsecase(
    AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSource(),
      localDataSource:
          AuthLocalDataSource(sharedPreferences: sharedPreferences),
    ),
  );

  runApp(MyApp(
    themeCubit: themeCubit,
    isLoggedIn: isLoggedIn,
    loginUsecase: loginUsecase,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  const MyApp(
      {super.key,
      required this.themeCubit,
      this.isLoggedIn = false,
      this.loginUsecase});
  final bool isLoggedIn;
  final loginUsecase;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: themeCubit),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
          loginUsecase //new
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop It',
            theme: theme,
            home: isLoggedIn ? Wrapper() : LoginPage(),
          );
        },
      ),
    );
  }
}
