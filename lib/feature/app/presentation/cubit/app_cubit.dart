import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/feature/login/logic/domain/user.dart';
import 'package:flutter_go_router/feature/login/logic/repositories/authentification_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthentificationRepository _authenticationGateway;
  late final StreamSubscription<User> _userSubscription;

  AppCubit(AuthentificationRepository authenticationGateway)
      : _authenticationGateway = authenticationGateway,
        super(
          authenticationGateway.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationGateway.currentUser)
              : const AppState.unauthenticated(),
        ) {
    _userSubscription = _authenticationGateway.user.listen(
      (user) => onAppUserChanged(user),
    );
  }
  onAppUserChanged(User user) {
    emit(
      user.isNotEmpty
          ? AppState.authenticated(user)
          : const AppState.unauthenticated(),
    );
  }

  onLogoutRequested() {
    unawaited(_authenticationGateway.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
