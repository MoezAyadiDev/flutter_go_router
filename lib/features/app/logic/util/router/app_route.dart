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
import 'package:injectable/injectable.dart';

@injectable
class AppRouter {
  final SessionCubit sessionCubit;
  const AppRouter(this.sessionCubit);

  GoRouter appRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      //initialLocation: '/',
      routes: [
        GoRoute(
          name: PageName.pageSplash,
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: PageName.pageSignIn,
          path: '/signIn',
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          name: PageName.pageHome,
          path: '/home',
          builder: (context, state) => const ShopScreen(),
          routes: [
            GoRoute(
              name: PageName.pageDetail,
              path: 'detail/:code',
              builder: (context, state) {
                return DetailScreen(article: state.params['code']!);
              },
              // pageBuilder: (context, state) {
              //   //final article = Article.fromJson(state.params);
              //   return MaterialPage(
              //     key: state.pageKey,
              //     child: DetailScreen(article: state.params['code']!),
              //   );
              // },
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
      redirect: (state) {
        debugPrint('redirect = ' + state.location.toString());
        debugPrint('sessionCubit.state = ' + sessionCubit.state.toString());

        //   // if the user is not logged in, they need to login

        if (sessionCubit.state is IsSignedIn) return '/home';
        if (sessionCubit.state is IsSignedOut) return '/signIn';
        //   if (sessionCubit.state is IsInitialState) return '/';

        //   //no need to redirect at all
        return null;
      },
    );
  }
}
