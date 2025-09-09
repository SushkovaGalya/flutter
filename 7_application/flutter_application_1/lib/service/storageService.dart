import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _weatherKey = 'weather_history';
  static const _uvKey      = 'uv_history';

  // Получить историю городов (список строк)
  static Future<List<String>> getWeatherHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_weatherKey) ?? [];
  }

  // Добавить город в историю (сохраняет уникально и в начало)
  static Future<void> addWeatherHistory(String city) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_weatherKey) ?? [];
    list.remove(city);
    list.insert(0, city);
    await prefs.setStringList(_weatherKey, list);
  }

  // Получить историю УФ‑вычислений (список JSON-строк)
  static Future<List<Map<String, dynamic>>> getUvHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_uvKey) ?? [];
    return raw.map((e) => Map<String, dynamic>.from(json.decode(e))).toList();
  }

  // Добавить запись УФ‑вычисления: {'uv': 5.5, 'risk': 3, 'time': '2025-05-19T12:34:56'}
  static Future<void> addUvHistory(double uv, int risk) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_uvKey) ?? [];
    final entry = json.encode({
      'uv': uv,
      'risk': risk,
      'time': DateTime.now().toIso8601String(),
    });
    list.insert(0, entry);
    await prefs.setStringList(_uvKey, list);
  }
}