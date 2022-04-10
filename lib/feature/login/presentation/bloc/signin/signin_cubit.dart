import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/feature/login/logic/service/signin_service.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignInService _service;

  SigninCubit(SignInService signInService)
      : _service = signInService,
        super(const SigninState());

  emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> validate() async {
    var _status = Validation.none;
    if (state.email == '') {
      _status = Validation.fail;
    }
    if (state.password == '') {
      _status = Validation.fail;
    }
    if (_status == Validation.fail) {
      emit(state.copyWith(status: _status));
    } else {
      emit(state.copyWith(status: Validation.loading));
      try {
        var _result = await _service(state.email, state.password);
        if (_result) {
          emit(state.copyWith(status: Validation.succes));
        } else {
          emit(state.copyWith(status: Validation.fail));
        }
      } catch (_) {
        emit(state.copyWith(status: Validation.fail));
      }
    }
  }
}
