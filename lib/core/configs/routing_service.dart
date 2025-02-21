import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopit/core/configs/routes.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:shopit/presentation/pages/login_page.dart';
import 'package:shopit/presentation/pages/wrapper.dart';

class RoutingService {
  final router = GoRouter(
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      return Routes.wrapper;
    }

    return Routes.login;
  },
  routes: [
  GoRoute(path: Routes.login, pageBuilder: (context, state) => MaterialPage(child: LoginPage())),
  GoRoute(path: Routes.register, pageBuilder: (context, state) => MaterialPage(child: LoginPage())),
 
  GoRoute(path: Routes.wrapper, pageBuilder: (context, state) => MaterialPage(child: Wrapper())),

  ],
  
);
}