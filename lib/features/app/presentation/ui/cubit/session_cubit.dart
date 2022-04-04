import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/features/auth/logic/service/user_service.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  var _isLoggedIn = false;

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
      _isLoggedIn = true;
    } else {
      emit(IsSignedOut());
      _isLoggedIn = false;
    }
  }

  login() {
    emit(IsSignedIn());
    _isLoggedIn = true;
  }

  loggedOut() {
    emit(IsSignedOut());
    _isLoggedIn = false;
  }

  showDetail({required Article article}) {
    emit(ShowDetail(article: article));
  }

  bool isLoggedIn() => _isLoggedIn;
}
