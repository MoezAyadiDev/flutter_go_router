part of 'session_cubit.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class IsInitialState extends SessionState {}

class IsSignedIn extends SessionState {}

class IsSignedOut extends SessionState {}

// class ShowDetail extends SessionState {
//   final Article article;
//   const ShowDetail({required this.article});
//   @override
//   List<Object> get props => [article];
// }
