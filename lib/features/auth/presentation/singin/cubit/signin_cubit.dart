import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/features/auth/logic/service/user_service.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final UserService _service;
  SigninCubit(UserService service)
      : _service = service,
        super(
          SigninInitial(),
        );

  signIn(String userName, String password) async {
    var _user = await _service.getUser(userName, password);
    if (_user == null) {
      emit(SignInFailure());
    } else {
      emit(SignInSucces());
    }
  }

  signOut() async {
    await _service.signOut();
    emit(SignInOff());
  }

  userStatut() async {
    var _user = await _service.getLocalUser();
    if (_user != null) {
      emit(SignInSucces());
    }
  }
}
