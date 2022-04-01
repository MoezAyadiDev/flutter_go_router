import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/logic/util/injection/injection.dart';
import 'package:flutter_go_router/features/app/logic/util/router/app_route.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<SessionCubit>()..initSession(),
      child: MaterialApp.router(
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
