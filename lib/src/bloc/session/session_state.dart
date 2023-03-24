part of 'session_bloc.dart';

class SessionState {
  final SessionModel? session;

  SessionState(this.session);

  SessionState copyWith({SessionModel? session}) {
    return SessionState(session ?? this.session);
  }
}
