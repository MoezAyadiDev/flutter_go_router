import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/logic/util/injection/injection.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:flutter_go_router/features/app/presentation/ui/widget/session_widget.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/cubit/signin_cubit.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/ui/widget/auth_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SessionWidget(
      child: BlocProvider(
        create: (context) => getIt<SigninCubit>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Auth Screen'),
          ),
          body: Builder(
            builder: (context) => BlocListener<SigninCubit, SigninState>(
              listener: (context, state) {
                debugPrint('SignIn Cubit State ' + state.toString());
                if (state is SignInSucces) {
                  BlocProvider.of<SessionCubit>(context).login();
                }
              },
              child: const AuthPage(),
            ),
          ),
        ),
      ),
    );
  }
}
