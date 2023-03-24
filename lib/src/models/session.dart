import 'package:prueba_emqu/src/models/user.dart';

class SessionModel {
  UserModel? user;
  // puede tener mas atributos como preferecias, etc.

  SessionModel({this.user});

  SessionModel copyWith({UserModel? user}) {
    return SessionModel(user: user ?? this.user);
  }
}
