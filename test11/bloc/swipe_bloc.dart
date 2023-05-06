import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeInitial()) {
    on<SwipeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
