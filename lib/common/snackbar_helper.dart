import 'package:flutter/material.dart';

/// Shows a floating SnackBar with custom message and optional color
void showMySnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor ?? const Color(0xFFFFAE37),
      duration: duration,
    ),
  );
}
