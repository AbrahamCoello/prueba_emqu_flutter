import 'package:flutter/material.dart';

import 'package:prueba_emqu/src/utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _wrapperInput(_inputEmail()),
          _wrapperInput(_inputPassword()),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0)),
            onPressed: () => _onSubmit(context),
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    ));
  }

  void _onSubmit(BuildContext context) {
    if (_emailController.text.trim().toLowerCase() != kEmailValue ||
        _passwordController.text.trim().toLowerCase() != kPasswordValue) {
      snackbarNotification(
          context: context,
          isError: true,
          message: 'Usuario o contraseña incorrectos');
      return;
    }

    Navigator.pushNamed(context, '/dashboard');
  }

  Widget _wrapperInput(Widget input) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: input,
    );
  }

  Widget _inputPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscured,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor ingrese su contraseña';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Contraseña',
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              icon: _isObscured
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))),
    );
  }

  Widget _inputEmail() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor ingrese su contraseña';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Correo electrónico',
        icon: Icon(Icons.email),
      ),
    );
  }
}
