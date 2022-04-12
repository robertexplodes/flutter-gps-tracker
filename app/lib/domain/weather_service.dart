import 'dart:convert';

import 'package:gpstracking/api/api_keys.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class WeatherService {
  // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  final String _baseURL = "https://api.openweathermap.org/data/2.5/weather";

  final Location _location = Location();

  Future<LocationData?> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await _location.getLocation();
  }

  Future<Map<String, dynamic>> loadWeather() async {
    var locationData = await getLocation();
    if (locationData == null) {
      return {"main" : "Weather could not be loaded."};
    }
    var response = await http.get(
      Uri.parse(
          '$_baseURL?lat=${locationData.latitude}&lon=${locationData.longitude.toString()}&appid=${weatherAPIKey}'),
    );
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    var weatherInformation = (data["weather"] as List<dynamic>)[0] as Map<String, dynamic>;
    return weatherInformation;
  }
}
