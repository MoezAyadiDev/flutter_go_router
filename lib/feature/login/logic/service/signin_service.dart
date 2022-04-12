import 'package:flutter_go_router/feature/login/logic/repositories/authentification_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SignInService {
  SignInService(this._authenticationGateway);
  final AuthentificationRepository _authenticationGateway;

  Future<bool> call(String email, String password) async {
    return _authenticationGateway.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
