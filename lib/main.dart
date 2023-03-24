import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:prueba_emqu/src/app.dart';
import 'package:prueba_emqu/src/providers/local_notifications_providers.dart';

void main() async {
  // Inicializamos el formato de fecha y hora para el idioma español
  await initializeDateFormatting();

  WidgetsFlutterBinding.ensureInitialized();
  // Inicializamos la instancia de notificaciones
  await initNotifications();

  runApp(const MyApp());
}
