part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();
  
  @override
  List<Object> get props => [];
}

class SwipeInitial extends SwipeState {}
