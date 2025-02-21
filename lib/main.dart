import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/core/configs/locator.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
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
  // Initialize service locator
  // Load .env file
  await dotenv.load(fileName: ".env");

  // Initialize service locator
  await setupLocator();

  // Load theme
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  // Retrieve SharedPreferences (ensure it's registered in locator)
  final sharedPreferences = locator<SharedPreferences>();
  final bool isLoggedIn = sharedPreferences.containsKey('user');

  // Get GoRouter instance
  final GoRouter router = locator<GoRouter>();

  runApp(MyApp(
    themeCubit: themeCubit,
    isLoggedIn: isLoggedIn,
    dataUsecase: locator<DataUsecase>(),
    router: router,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  final bool isLoggedIn;

  final dataUsecase;
  final GoRouter router;

  const MyApp({
    super.key,
    required this.themeCubit,
    this.isLoggedIn = false,
    this.dataUsecase,
    required this.router,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //theme cubit
        BlocProvider<ThemeCubit>.value(value: themeCubit),
        //auth bloc
        BlocProvider<AuthBloc>(create: (context) {
          final authBloc =
              AuthBloc(locator<LoginUsecase>(), locator<AuthLocalDataSource>());
          authBloc.add(AppStartedEvent());
          return authBloc;
        }),

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
