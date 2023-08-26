import 'package:flutter/material.dart';

import 'weather_models.dart';
import 'weather_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<MyApp> {
  final WeatherProvider _weatherProvider = WeatherProvider();
  late Welcome _weatherData;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _fetchWeatherData() async {
  //   try {
  //     final weatherData = await WeatherProvider.getWeatherByLocation();
  //     setState(() {
  //       _weatherData = weatherData;
  //     });
  //   } catch (error) {
  //     print('Error fetching weather data: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    WeatherProvider.getWeatherByLocation();
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Text('data')
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text('Temperature: ${_weatherData.main.temp}°C'),
        //       Text('Weather: ${_weatherData.weather[0].description}'),
        //     ],
        //   ),
        // ),
        );
  }
}
