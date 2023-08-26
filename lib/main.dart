import 'package:flutter/material.dart';

import 'weather_models.dart';
import 'weather_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<MyApp> {
  final WeatherProvider _weatherProvider = WeatherProvider();
  late Welcome _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final weatherData = await _weatherProvider.getWeatherByLocation();
      setState(() {
        _weatherData = weatherData;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: _weatherData != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Temperature: ${(_weatherData.main.temp - 273.15).toStringAsFixed(2)}'),
                    Text('Weather: ${_weatherData.weather[0].description}'),
                    Text('Timezone : ${_weatherData.timezone}'),
                    Text('${_weatherData.name}')
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
