import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/feature/login/presentation/bloc/signin/signin_cubit.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocListener<SigninCubit, SigninState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == Validation.fail) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Forme not valid'),
                ),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'registred email adress',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    BlocProvider.of<SigninCubit>(context).emailChanged(value);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Your password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    BlocProvider.of<SigninCubit>(context)
                        .passwordChanged(value);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      BlocProvider.of<SigninCubit>(context).validate();
                    }
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Text('SIGN IN'),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextButton(
                    onPressed: () {
                      context.push('/signup');
                    },
                    child: const Text('Sign up'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
