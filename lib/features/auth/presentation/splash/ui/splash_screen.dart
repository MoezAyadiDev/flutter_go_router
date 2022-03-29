import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        if (state is IsSignedIn) {
          context.go('/home');
        } else if (state is IsSignedOut) {
          context.go('/signIn');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splash Screen'),
        ),
        body: const Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
