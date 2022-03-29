import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/core/util/injection/injection.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/cubit/signin_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => getIt<SigninCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auth Screen'),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Text('Sign in', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 40),
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  controller: _usernameController,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {}
}
