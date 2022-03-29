import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/features/auth/logic/service/user_service.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final UserService _service;
  SessionCubit(UserService service)
      : _service = service,
        super(
          IsInitialState(),
        );
  initSession() async {
    var _user = await _service.getLocalUser();
    if (_user != null) {
      emit(IsSignedIn());
    } else {
      emit(IsSignedOut());
    }
  }

  login() {
    emit(IsSignedIn());
  }

  loggedOut() {
    emit(IsSignedOut());
  }
}
