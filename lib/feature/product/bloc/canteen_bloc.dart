// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/main_failure.dart';
import '../domain/model/canteen.dart';

part 'canteen_event.dart';
part 'canteen_state.dart';

@injectable
class CanteenBloc extends Bloc<CanteenEvent, CanteenState> {
  final CanteenService _CanteenService;
  CanteenBloc(this._CanteenService) : super(CanteenState.initial()) {
    on<LaunchCanteens>((event, emit) async {
      await _CanteenService.fetchCanteensFromServer();
    });
    on<GetCanteens>((event, emit) async {
      await getCanteens(emit);
    });
  }

  Future<void> getCanteens(Emitter<CanteenState> emit) async {
    emit(CanteenState(
      Canteens: const [],
      isLoading: true,
      isError: false,
    ));
    final Canteens = await _CanteenService.fetchCanteensFromLocal();
    Canteens.fold((MainFailure f) {
      emit(CanteenState(
        Canteens: const [],
        isLoading: false,
        isError: true,
      ));
    }, (List<CanteenElement> list) {
      if (kDebugMode) {
        print('success');
      }
      emit(CanteenState(
        Canteens: list,
        isLoading: false,
        isError: false,
      ));
    });
  }
}
