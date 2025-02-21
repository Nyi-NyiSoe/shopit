import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopit/core/configs/routes.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthSuccess) {
        context.go(Routes.wrapper);
      } else if (state is AuthError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/shopping.png',
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'Shop It',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginEvent(
                        username: _usernameController.text,
                        password: _passwordController.text));
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      );
    }))));
  }
}
