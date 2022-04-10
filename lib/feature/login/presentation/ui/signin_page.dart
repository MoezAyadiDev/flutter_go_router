import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/feature/app/core/injection/injection.dart';
import 'package:flutter_go_router/feature/login/presentation/bloc/signin/signin_cubit.dart';
import 'package:flutter_go_router/feature/login/presentation/ui/widget/signin/signin_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SigninCubit>(),
      child: const SignInBody(),
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentification')),
      body: Center(
        child: SizedBox(
          width: 400,
          child: SignInForm(),
        ),
      ),
    );
  }
}
