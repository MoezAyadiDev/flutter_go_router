import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:flutter_go_router/features/auth/logic/repository/user_repository.dart';
import 'package:flutter_go_router/features/auth/logic/service/user_service.dart';
import 'package:flutter_go_router/features/auth/presentation/singin/cubit/signin_cubit.dart';
import 'package:flutter_go_router/features/shop/logic/repository/article_repository.dart';
import 'package:flutter_go_router/features/shop/logic/service/article_service.dart';
import 'package:flutter_go_router/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupInjection() {
  // Repository
  getIt.registerLazySingleton(() => UserRepository());
  getIt.registerLazySingleton(() => ArticleRepository());

  // Service
  getIt.registerLazySingleton(() => UserService(getIt()));
  getIt.registerLazySingleton(() => ArticleService(getIt()));

  // Bloc
  getIt.registerFactory(() => SigninCubit(getIt()));
  getIt.registerFactory(() => SessionCubit(getIt()));
  getIt.registerFactory(() => ShopCubit(getIt()));
}
