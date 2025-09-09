import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лабораторная работа №2 Сушкова Г.С. ИВТ-22 вар(2)'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
          Column(
            children: [
              //В  задании сказано добавить текстовые виджеты ик каждому текстовому виджету добавить стиль и отступ. Отступ сделан с помощью padding это виджет, который добавляет отступы (поля) вокруг своего дочернего элемента. Он используется, чтобы задать расстояние между виджетами или их границами.
              Padding(padding: EdgeInsets.all(16.0), 
              child: Text('Фио: Сушкова Галина Сергеевна', style: TextStyle(fontSize: 30, color: Color.fromRGBO(3, 252, 198, 1.0) ))),
              Padding(padding: EdgeInsets.all(16.0),
              child: Text('Группа  обучения: ИВТ-22 ', style: TextStyle(fontSize: 25,color: Color.fromRGBO(3, 252, 45, 1.0)),)),
              Padding(padding: EdgeInsets.all(16.0),
              child: Text('Год рождения: 2004', style: TextStyle(fontSize: 20, color: Color.fromRGBO(3, 119, 252, 1.0))))
            ],
          )
        ],
      ),
    );
  }
}