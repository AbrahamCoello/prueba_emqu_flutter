part of 'indicators_bloc.dart';

@immutable
abstract class IndicatorsEvent {}

class SetIndicatorsEvent extends IndicatorsEvent {
  final DateTime? date;
  SetIndicatorsEvent({this.date});
}

class UnsetIndicatorsEvent extends IndicatorsEvent {}
