import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/auth/logic/service/user_service.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';
import 'package:injectable/injectable.dart';

part 'session_state.dart';

@injectable
class SessionCubit extends Cubit<SessionState> {
  //var _isLoggedIn = false;

  final UserService _service;
  SessionCubit(UserService service)
      : _service = service,
        super(
          IsInitialState(),
        );
  initSession() async {
    debugPrint('1');
    var _user = await _service.getLocalUser();
    if (_user != null) {
      debugPrint('2');
      emit(IsSignedIn());
      //_isLoggedIn = true;
    } else {
      debugPrint('2');
      emit(IsSignedOut());
      //_isLoggedIn = false;
    }
  }

  login() {
    emit(IsSignedIn());
    //_isLoggedIn = true;
  }

  loggedOut() {
    emit(IsSignedOut());
    //_isLoggedIn = false;
  }

  // showDetail({required Article article}) {
  //   emit(ShowDetail(article: article));
  // }

  //bool isLoggedIn() => _isLoggedIn;
}
