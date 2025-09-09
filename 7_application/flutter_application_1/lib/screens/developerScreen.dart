import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('О разработчике')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ФИО: Сушкова Галина Сергеевна'),
            Text('Группа: ИВТ-22'),
            Text('Email: Sushkova3103@gmail.com'),
          ],
        ),
      ),
    );
  }
}