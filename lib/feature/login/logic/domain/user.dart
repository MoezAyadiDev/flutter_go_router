import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userName;
  final String password;
  static const empty = User(id: '', userName: '', password: '');
  const User(
      {required this.id, required this.userName, required this.password});

  @override
  List<Object?> get props => [
        userName,
        password,
        id,
      ];
  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  static const fake = User(
    id: 'id1',
    userName: 'MoezAyadi',
    password: '123456',
  );
}
