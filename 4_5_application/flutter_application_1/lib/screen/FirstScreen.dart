import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'cubit/main_screen_cubit_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fieldA = TextEditingController();
  final _fieldB = TextEditingController();
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторная работа №3 Сушкова Г.С. ИВТ-22 вар(2)'),
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            context.read<NavigationCubit>().showHistoryScreen();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Введите число a'),
              TextFormField(
                controller: _fieldA,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => value!.isEmpty ? 'Пожалуйста введите число!' : null,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text('Введите число b'),
              TextFormField(
                controller: _fieldB,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => value!.isEmpty ? 'Пожалуйста введите число!' : null,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: _agreement,
                title: const Text(
                  'Согласны ли вы на использование калькулятора квадратных чисел?',
                  style: TextStyle(fontSize: 10.0),
                ),
                onChanged: (bool? value) => setState(() => _agreement = value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agreement) {
                    final int numA = int.parse(_fieldA.text);
                    final int numB = int.parse(_fieldB.text);
                    context.read<NavigationCubit>().calculateAndShowSecondScreen(numA, numB);
                  } else if (!_agreement) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Вы не согласились с условиями!')),
                    );
                  }
                },
                child: const Text('Передача параметров'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}