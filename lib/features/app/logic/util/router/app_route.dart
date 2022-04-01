import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/ui/auth_screen.dart';
import 'package:flutter_go_router/features/auth/presentation/splash/ui/splash_screen.dart';
import 'package:flutter_go_router/features/shop/presentation/ui/shop_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/signIn',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ShopScreen(),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(
          '404 Not Found : ${state.error.toString()}',
        ),
      ),
    ),
  ),
);
