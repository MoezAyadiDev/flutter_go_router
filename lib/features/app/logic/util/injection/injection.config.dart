// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../auth/logic/repository/user_repository.dart' as _i5;
import '../../../../auth/logic/service/user_service.dart' as _i6;
import '../../../../auth/presentation/singin/cubit/signin_cubit.dart' as _i8;
import '../../../../shop/logic/repository/article_repository.dart' as _i3;
import '../../../../shop/logic/service/article_service.dart' as _i4;
import '../../../presentation/ui/cubit/session_cubit.dart' as _i7;
import '../router/app_route.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticleRepository>(() => _i3.ArticleRepository());
  gh.factory<_i4.ArticleService>(
      () => _i4.ArticleService(get<_i3.ArticleRepository>()));
  gh.factory<_i5.UserRepository>(() => _i5.UserRepository());
  gh.factory<_i6.UserService>(() => _i6.UserService(get<_i5.UserRepository>()));
  gh.factory<_i7.SessionCubit>(() => _i7.SessionCubit(get<_i6.UserService>()));
  gh.factory<_i8.SigninCubit>(() => _i8.SigninCubit(get<_i6.UserService>()));
  gh.factory<_i9.AppRouter>(() => _i9.AppRouter(get<_i7.SessionCubit>()));
  return get;
}
