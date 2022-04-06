import 'package:flutter_go_router/features/auth/logic/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRepository {
  User? _user;

  Future<User?> getLocalUser() async {
    return _user;
  }

  Future<User> getUser(String userName, String password) async {
    _user = User(userName: userName, password: password);
    return _user!;
  }

  signOut() {
    _user = null;
  }
}
