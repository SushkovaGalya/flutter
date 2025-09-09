import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/weatherCubit.dart';
import '../cubit/historyCubit.dart';
import 'developerScreen.dart';
import 'uvCalcScreen.dart';
import 'cameraScreen.dart';
import 'historyScreen.dart';


class HomeScreen extends StatelessWidget {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Слушаем завершение загрузки погоды
        BlocListener<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoaded) {
              // сохраняем город в историю
              context.read<HistoryCubit>().addWeather(state.weather.city);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Погода')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'Введите город'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<WeatherCubit>().fetchWeather(cityController.text),
                child: Text('Получить погоду'),
              ),
              Expanded(
                child: BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading)
                      return Center(child: CircularProgressIndicator());
                    if (state is WeatherLoaded)
                      return Column(
                        children: [
                          Text('Город: ${state.weather.city}'),
                          Text('Температура: ${state.weather.temperature}°C'),
                          Text('Описание: ${state.weather.description}'),
                        ],
                      );
                    if (state is WeatherError) return Text(state.message);
                    return Container();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DeveloperScreen())),
                      child: Text('О разработчике')),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => UVScreen())),
                      child: Text('УФ')),
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CameraScreen())),
                      child: Text('Камера')),
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HistoryScreen())),
                      child: Text('История')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}