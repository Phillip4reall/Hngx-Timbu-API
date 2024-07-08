import 'package:flutter/material.dart';
import 'errors.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.error});
  final Object error;

  String get message {
    if (error is ApiError) {
      return (error as ApiError).message;
    }
    if (error is String) return error as String;
    return error.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline_rounded,
            size: 80.0, color: Color(0XFF534432)),
        const SizedBox(height: 10.0),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Color(0XFF534432)),
        ),
      ],
    );
  }
}
