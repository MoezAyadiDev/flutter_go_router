// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../login/logic/repositories/authentification_repository.dart'
    as _i3;
import '../../../login/logic/service/signin_service.dart' as _i4;
import '../../../login/presentation/bloc/signin/signin_cubit.dart' as _i5;
import '../../presentation/cubit/app_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthentificationRepository>(
      () => _i3.AuthentificationRepository());
  gh.singleton<_i4.SignInService>(
      _i4.SignInService(get<_i3.AuthentificationRepository>()));
  gh.singleton<_i5.SigninCubit>(_i5.SigninCubit(get<_i4.SignInService>()));
  gh.singleton<_i6.AppCubit>(
      _i6.AppCubit(get<_i3.AuthentificationRepository>()));
  return get;
}
