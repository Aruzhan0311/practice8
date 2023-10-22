import 'repos_event.dart';
import 'repos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  ReposBloc() : super(InitialState()) {
    on<SubmitEvent>(_onSubmitEvent);
  }

  Future<void> _onSubmitEvent(
      SubmitEvent event, Emitter<ReposState> emit) async {
    await Future.delayed(Duration(seconds: 2));

    emit(SuccessState(event.userInfo));
  }
}
