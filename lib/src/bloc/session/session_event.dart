part of 'session_bloc.dart';

@immutable
abstract class SessionEvent {}

class SetSessionEvent extends SessionEvent {
  final SessionModel session;

  SetSessionEvent(this.session);
}

class UnsetSessionEvent extends SessionEvent {}
