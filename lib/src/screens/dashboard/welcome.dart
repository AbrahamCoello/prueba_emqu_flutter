import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:prueba_emqu/src/bloc/session/session_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        final user = state.session?.user;
        final username = user?.fullName ?? '';
        final dateTime = DateTime.now();
        final formatter = DateFormat('EEEE, d MMMM y', 'es_ES');
        return Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              username.isNotEmpty ? 'Bienvenido, $username' : 'Bienvenido',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              formatter.format(dateTime)[0].toUpperCase() +
                  formatter.format(dateTime).substring(1),
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Revisa el comportamiento de tu inversión',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        );
      },
    );
  }
}
