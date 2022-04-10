import 'package:flutter/widgets.dart';
import 'package:flutter_go_router/feature/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_go_router/feature/login/presentation/ui/signin_page.dart';
import 'package:flutter_go_router/feature/login/presentation/ui/signup_page.dart';
import 'package:flutter_go_router/feature/shop/presentation/ui/shop_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GoRouter router(BuildContext context, String? initialLocation) => GoRouter(
      initialLocation: initialLocation ?? Routes.login,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(context.read<AppCubit>().stream),
      routes: [
        GoRoute(
          path: Routes.signup,
          builder: (context, state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return const ShopPage();
          },
        ),
      ],
      redirect: (state) {
        final loggedIn = context.read<AppCubit>().state.isAuthenticated;
        final loggingIn = state.subloc == Routes.login;
        final signingUp = state.subloc == Routes.signup;

        if (signingUp) {
          return null;
        }

        if (!loggedIn) {
          return loggingIn ? null : Routes.login;
        }
        if (loggingIn) {
          return Routes.home;
        }

        return null;
      },
    );

class Routes {
  static const signup = '/signup';
  static const login = '/login';
  static const home = '/home';
}
