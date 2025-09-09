import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Произошла ошибка',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}