part of 'indicators_bloc.dart';

class IndicatorsState {
  DateTime? date;

  IndicatorsState({this.date});

  IndicatorsState copyWith({DateTime? date}) {
    return IndicatorsState(date: date ?? this.date);
  }
}
