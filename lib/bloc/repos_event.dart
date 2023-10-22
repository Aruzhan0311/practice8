import '../personalpage.dart';

abstract class ReposEvent {}

class SubmitEvent extends ReposEvent {
  final UserInfo userInfo;

  SubmitEvent(this.userInfo);
}
