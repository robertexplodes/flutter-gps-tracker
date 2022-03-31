import 'package:flutter/cupertino.dart';
import 'package:gpstracking/domain/weather_service.dart';

class WeatherProvider with ChangeNotifier {

  Map<String, dynamic> weatherData = {};

  Future<Map<String, dynamic>> loadWeatherData({bool refresh = false}) async {
    if(weatherData.isEmpty || refresh) {
      weatherData = await _weatherService.loadWeather();
      notifyListeners();
    }
    return weatherData;
  }

  WeatherService _weatherService = WeatherService();

}