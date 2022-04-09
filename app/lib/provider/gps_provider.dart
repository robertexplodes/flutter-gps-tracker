import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gpstracking/api/urls.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class GPSProvider with ChangeNotifier {
  Location location = Location();

  StreamSubscription<LocationData>? locationSubscription;

  bool running = false;

  void startNewRun() async {
    running = true;
    var response = await http.post(Uri.parse('$baseUrl/runs'), body: jsonEncode({
      "start": DateTime.now().toIso8601String(),
    }), headers: {
      "Content-Type": "application/json"
    });
    var data = jsonDecode(response.body);
    print(data);
  }

  void startListening() {
    location.enableBackgroundMode(enable: true);
    locationSubscription = location.onLocationChanged.listen((event) {
      print("post");
      http.post(Uri.parse('$baseUrl/runs/1/coordinates'),
          body:
        jsonEncode({"latitude": event.latitude, "longitude": event.longitude}),
        headers: {
        "Content-Type": "application/json",
        }
      );
    });
  }

  void stopListening() async {
    await locationSubscription?.cancel();
  }
}
