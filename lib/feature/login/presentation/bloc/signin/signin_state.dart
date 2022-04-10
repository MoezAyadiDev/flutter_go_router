part of 'signin_cubit.dart';

enum Validation { none, loading, succes, fail }

class SigninState extends Equatable {
  final String email;
  final String password;
  final Validation status;
  const SigninState({
    this.email = '',
    this.password = '',
    this.status = Validation.none,
  });

  SigninState copyWith({
    String? email,
    String? password,
    Validation? status,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password];
}
