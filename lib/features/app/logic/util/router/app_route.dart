import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/app/logic/util/injection/injection.dart';
import 'package:flutter_go_router/features/app/logic/util/router/page_name.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/ui/auth_screen.dart';
import 'package:flutter_go_router/features/auth/presentation/splash/ui/splash_screen.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';
import 'package:flutter_go_router/features/shop/presentation/dashboard/ui/shop_screen.dart';
import 'package:flutter_go_router/features/shop/presentation/detail/ui/detail_screen.dart';
import 'package:go_router/go_router.dart';

SessionCubit sessionCubit = getIt<SessionCubit>();

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: PageName.pageSplash,
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      name: PageName.pageSignIn,
      path: '/signIn',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      name: PageName.pageHome,
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ShopScreen(),
      ),
      routes: [
        GoRoute(
          name: PageName.pageDetail,
          path: 'detail/:code',
          pageBuilder: (context, state) {
            //final article = Article.fromJson(state.params);
            return MaterialPage(
              key: state.pageKey,
              child: DetailScreen(article: state.params['code']!),
            );
          },
        ),
      ],
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
  urlPathStrategy: UrlPathStrategy.path,
  refreshListenable: GoRouterRefreshStream(sessionCubit.stream),
  // redirect: (state) {
  //   debugPrint('redirect = ' + state.location.toString());

  //   // // if the user is not logged in, they need to login
  //   // final loggedIn = loginInfo.loggedIn;
  //   // final loggingIn = state.subloc == '/login';
  //   // if (!loggedIn) return loggingIn ? null : '/login';

  //   // // if the user is logged in but still on the login page, send them to
  //   // // the home page
  //   // if (loggingIn) return '/';

  //   // no need to redirect at all
  //   return null;
  // },
);
