import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:go_router/go_router.dart';

class SessionWidget extends StatelessWidget {
  final Widget child;
  const SessionWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

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
      child: child,
    );
  }
}
