import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/logic/util/injection/injection.dart';
import 'package:flutter_go_router/features/app/logic/util/router/app_route.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = getIt<AppRouter>();
    var appRoute = appRouter.appRouter();
    return BlocProvider(
      create: (BuildContext context) => getIt<SessionCubit>()..initSession(),
      child: MaterialApp.router(
        routeInformationParser: appRoute.routeInformationParser,
        routerDelegate: appRoute.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
