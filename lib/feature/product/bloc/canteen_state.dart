// ignore_for_file: must_be_immutable, non_constant_identifier_names

part of 'canteen_bloc.dart';

class CanteenState extends Equatable {
  List<CanteenElement> Canteens;
  bool isLoading;
  bool isError;

  CanteenState({
    required this.Canteens,
    required this.isLoading,
    required this.isError,
  });

  factory CanteenState.initial() =>
      CanteenState(Canteens: const [], isLoading: false, isError: false);

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [Canteens, isLoading, isError];

  @override
  // ignore: todo
  // TODO: implement stringify
  bool? get stringify => true;

  CanteenState copyWith({
    List<CanteenElement>? Canteens,
    bool? isLoading,
    bool? isError,
  }) {
    return CanteenState(
      Canteens: Canteens ?? this.Canteens,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
