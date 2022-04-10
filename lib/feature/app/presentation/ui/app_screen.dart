import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/feature/app/core/injection/injection.dart';
import 'package:flutter_go_router/feature/app/core/route/app_route.dart';
import 'package:flutter_go_router/feature/app/presentation/cubit/app_cubit.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppCubit>(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = router(context, null);

    return MaterialApp.router(
      routerDelegate: _appRouter.routerDelegate,
      routeInformationParser: _appRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}
