import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'indicators_event.dart';
part 'indicators_state.dart';

class IndicatorsBloc extends Bloc<IndicatorsEvent, IndicatorsState> {
  IndicatorsBloc() : super(IndicatorsState()) {
    on<IndicatorsEvent>((event, emit) {
      if (event is SetIndicatorsEvent) {
        emit(IndicatorsState(date: event.date));
      }
      if (event is UnsetIndicatorsEvent) {
        emit(IndicatorsState());
      }
    });
  }
}
