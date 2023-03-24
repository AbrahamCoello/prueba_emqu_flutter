import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prueba_emqu/src/utils/utils.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

onSelectNotification(NotificationResponse notificationResponse) {
  print("payload ${notificationResponse.payload}");
  if (notificationResponse.payload == null) {
    return;
  }
}

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // IOS
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();
  // Linux
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'CLICK_ACTION');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    linux: initializationSettingsLinux,
  );

  // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
  //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  // final didNotificationLaunchApp =
  //     notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  // if (didNotificationLaunchApp) {
  //   final notificationResponse =
  //       notificationAppLaunchDetails!.notificationResponse!;
  //   onSelectNotification(notificationResponse);
  // } else {
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onDidReceiveNotificationResponse: (response) async {
  //     print('onDidReceiveNotificationResponse');
  //     onSelectNotification(response);
  //   }, onDidReceiveBackgroundNotificationResponse: onSelectNotification);
  // }

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (response) async {
    print('onDidReceiveNotificationResponse');
    onSelectNotification(response);
  }, onDidReceiveBackgroundNotificationResponse: onSelectNotification);
}

// Este es el método que muestra la notificación
Future<void> showLocalNotificacion(
    {String title = 'Titulo',
    String body =
        'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.',
    String payload = ''}) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    '123',
    'Canal 1',
    importance: Importance.max,
    priority: Priority.high,
  );
  const LinuxNotificationDetails linuxNotificationDetails =
      LinuxNotificationDetails(defaultActionName: 'CLICK_ACTION');

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    linux: linuxNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
      generateRandomInt(), title, body, notificationDetails,
      payload: payload);
}
