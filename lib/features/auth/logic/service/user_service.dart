import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/auth/logic/domain/user.dart';
import 'package:flutter_go_router/features/auth/logic/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserService {
  final UserRepository _repository;
  const UserService(UserRepository repository) : _repository = repository;

  Future<User?> getLocalUser() async {
    debugPrint('getLocalUser');
    return await _repository.getLocalUser();
  }

  Future<User?> getUser(String userName, String password) async {
    return await _repository.getUser(userName, password);
  }

  Future<User?> signOut() async {
    return await _repository.signOut();
  }
}
