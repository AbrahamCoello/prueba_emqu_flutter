import 'package:flutter/material.dart';

import 'package:prueba_emqu/src/screens/login/login_form.dart';
import 'package:prueba_emqu/src/screens/login/user_avatar_setup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _squareTop(context),
          _header(context),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  UserAvatarSetup(),
                  SizedBox(height: 20.0),
                  LoginForm(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _squareTop(BuildContext context) {
    return Transform(
      transform: Matrix4.skewY(-0.1),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.19,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  '¡Elige tu avatar, llena los campos y comienza a usar la app!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
