import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowSnackBar({
  required BuildContext context,
  required String message,
  Color color = Colors.red,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: color, content: Text(message)),
  );
}
