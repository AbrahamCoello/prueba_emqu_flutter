import 'package:flutter/material.dart';

/// Muestra una notificación tipo [SnackBar] en la parte inferior de la pantalla.
snackbarNotification({
  required BuildContext context,
  String message = '',
  Widget? messageCustom,
  SnackBarAction? action,
  bool isError = false,
  bool isSuccess = false,
  int durationInSeconds = 4,
}) {
  Color bgColor;

  if (isError) {
    bgColor = Colors.red.shade400;
  } else if (isSuccess) {
    bgColor = Colors.green.shade400;
  } else {
    bgColor = Theme.of(context).primaryColor;
  }

  final snackBar = SnackBar(
    content: messageCustom ?? Text(message),
    backgroundColor: bgColor,
    shape: ShapeBorder.lerp(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      0.5,
    ),
    action: action,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    duration: Duration(seconds: durationInSeconds),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
