part of 'canteen_bloc.dart';

abstract class CanteenEvent extends Equatable {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [];
}

class Initialize extends CanteenEvent {}

class GetCanteens extends CanteenEvent {}

class LaunchCanteens extends CanteenEvent {}
