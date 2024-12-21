import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/presentation/bloc/theme_bloc/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: context.watch<ThemeCubit>().state.brightness ==
                      Brightness.light
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny),
              onPressed: () async {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
         
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
