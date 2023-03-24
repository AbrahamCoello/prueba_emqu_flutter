import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_emqu/src/bloc/indicators/indicators_bloc.dart';
import 'package:prueba_emqu/src/bloc/session/session_bloc.dart';
import 'package:prueba_emqu/src/providers/local_notifications_providers.dart';
import 'package:prueba_emqu/src/screens/dashboard/banner_adds.dart';
import 'package:prueba_emqu/src/screens/dashboard/buttons_week.dart';
import 'package:prueba_emqu/src/screens/dashboard/line_chart_indicator.dart';
import 'package:prueba_emqu/src/screens/dashboard/welcome.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Timer _debounce = Timer.periodic(const Duration(seconds: 1), (timer) {});

  _timer() {
    if (_debounce.isActive) {
      _debounce.cancel();
    }
    _debounce = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Verificar el inicio de la hora actual
      final now = DateTime.now();
      final isStartHour = now.minute == 0 && now.second == 0;
      if (isStartHour) {
        showLocalNotificacion(
          title: 'Hola!',
          body: 'Tiene nueva información acerca de nuestra empresa',
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _timer();
  }

  @override
  void dispose() {
    super.dispose();

    _debounce.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        final title = state.session?.user?.fullName ?? 'Dashboard';
        final photoUrl = state.session?.user?.avatarUrl ??
            'https://www.w3schools.com/howto/img_avatar.png';
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(photoUrl),
              ),
            ),
            title: Text(title),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<SessionBloc>().add(UnsetSessionEvent());
                    context.read<IndicatorsBloc>().add(UnsetIndicatorsEvent());

                    Navigator.pushNamed(context, '/');
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Welcome(),
                    LineChartIndicator(),
                    ButtonsWeek()
                  ],
                ),
              ),
              const BannerAdds()
            ],
          ),
        );
      },
    );
  }
}
