import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/cubit/cubitScreenProvider.dart';
import 'screen/errorScreen.dart';
import 'screen/loadingScreen.dart';
import 'screen/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NasaCubit(),
      child: MaterialApp(
        title: 'Лабораторная работа 6 Выполнила Сушкова Галина ИВТ-22',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NasaCubit>().loadData(); // Загружаем данные при старте
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NASA Photos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
body: BlocBuilder<NasaCubit, NasaState>(
  builder: (context, state) {
    if (state is NasaLoadingState) {
      return const LoadingScreen();
    } else if (state is NasaLoadedState) {
      return MainScreen(photos: state.data.photos!);
    } else if (state is NasaErrorState) {
      return const ErrorScreen();
    } else {
      return const SizedBox.shrink();
    }
  },
),
    );
  }
}
