import 'dart:async';

import 'package:flutter_go_router/feature/login/logic/domain/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthentificationRepository {
  AuthentificationRepository({this.isAuthenticated = false});

  bool isAuthenticated;

  final _controller = StreamController<User>.broadcast();

  User get currentUser => isAuthenticated ? User.fake : User.empty;

  Stream<User> get user {
    return _controller.stream.asBroadcastStream(
      onListen: (_) {
        _controller.add(isAuthenticated ? User.fake : User.empty);
      },
    );
  }

  Future<bool> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    _controller.add(User.fake);
    isAuthenticated = true;
    return Future.value(true);
  }

  Future<bool> logOut() {
    _controller.add(User.empty);
    isAuthenticated = false;
    return Future.value(true);
  }
}
