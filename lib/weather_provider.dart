import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import 'weather_models.dart';

class WeatherProvider {
  static const String apiKey = 'a5d1b29e548a151b68b851a339a0c5de';
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Welcome> getWeatherByLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final response = await http.get(
      Uri.parse(
          '$apiUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return Welcome.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
