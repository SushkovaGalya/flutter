import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weatherModel.dart';
import '../service/weatherService.dart';


abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await WeatherService.getWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Ошибка: $e'));
    }
  }
}