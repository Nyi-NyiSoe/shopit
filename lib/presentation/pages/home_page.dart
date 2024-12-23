import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/core/theme/app_theme.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:shopit/presentation/bloc/theme_bloc/theme_cubit.dart';
import 'package:shopit/presentation/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: context.watch<ThemeCubit>().state == AppTheme().darkTheme
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutEvent());

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                icon: Icon(Icons.logout_outlined))
          ],
          title: const Text('Shop It'),
        ),
        body: const Center(
          child: Text('Welcome to Shop It'),
        ),
      ),
    );
  }
}
