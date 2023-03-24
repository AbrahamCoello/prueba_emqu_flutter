import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:prueba_emqu/src/models/session.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionState(SessionModel())) {
    on<SessionEvent>((event, emit) {
      if (event is SetSessionEvent) {
        emit(SessionState(event.session));
      }
      if (event is UnsetSessionEvent) {
        emit(SessionState(SessionModel()));
      }
    });
  }
}
