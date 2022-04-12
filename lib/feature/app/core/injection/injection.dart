// import 'package:flutter_go_router/feature/app/presentation/cubit/app_cubit.dart';
// import 'package:flutter_go_router/feature/login/logic/repositories/authentification_repository.dart';
// import 'package:flutter_go_router/feature/login/logic/service/signin_service.dart';
// import 'package:flutter_go_router/feature/login/presentation/bloc/signin/signin_cubit.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// Future<void> resolveDependencies({
//   bool? isAuthenticated,
// }) async {
//   getIt
//     ..registerLazySingleton(() => AuthentificationRepository())

//     // Use-cases
//     ..registerSingleton<SignInService>(SignInService(getIt()))

//     // Blocs
//     ..registerSingleton<AppCubit>(AppCubit(getIt()))
//     ..registerSingleton<SigninCubit>(SigninCubit(getIt()));
// }

import 'package:flutter_go_router/feature/app/core/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
