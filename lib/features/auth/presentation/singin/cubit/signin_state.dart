part of 'signin_cubit.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninInitial extends SigninState {}

class SignInSucces extends SigninState {}

class SignInFailure extends SigninState {}

class SignInOff extends SigninState {}
