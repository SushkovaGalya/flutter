import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weatherModel.dart';

class WeatherService {
  static const String apiKey = 'e6a34d01537e98fc1ffb077a4df7f20a';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&units=metric&appid=$apiKey&lang=ru'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Не удалось загрузить погоду');
    }
  }
}