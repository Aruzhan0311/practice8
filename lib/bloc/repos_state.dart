import '../personalpage.dart';

abstract class ReposState {}

class InitialState extends ReposState {}

class SuccessState extends ReposState {
  final UserInfo userInfo;

  SuccessState(this.userInfo);
}

class ErrorState extends ReposState {}
