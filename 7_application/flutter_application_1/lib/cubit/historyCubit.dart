import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/storageService.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<String> weatherHistory;
  final List<Map<String, dynamic>> uvHistory;
  HistoryLoaded({required this.weatherHistory, required this.uvHistory});
}

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  Future<void> loadAll() async {
    final w = await StorageService.getWeatherHistory();
    final u = await StorageService.getUvHistory();
    emit(HistoryLoaded(weatherHistory: w, uvHistory: u));
  }

  Future<void> addWeather(String city) async {
    await StorageService.addWeatherHistory(city);
    await loadAll();
  }

  Future<void> addUv(double uv, int risk) async {
    await StorageService.addUvHistory(uv, risk);
    await loadAll();
  }
}