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
  int? currentRunId;

  void startNewRun() async {
    running = true;
    var response = await http.post(Uri.parse('$baseUrl/runs'), body: jsonEncode({
      "start": DateTime.now().toIso8601String(),
    }), headers: {
      "Content-Type": "application/json"
    });
    var data = jsonDecode(response.body);
    currentRunId = data;
    startListening();
  }

  void startListening() {
    location.enableBackgroundMode(enable: true);
    locationSubscription = location.onLocationChanged.listen((event) {
      print("post");
      http.post(Uri.parse('$baseUrl/runs/$currentRunId/coordinates'),
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
  
  void finishRun(Duration duration) async {
    stopListening();
    running = false;
    http.post(Uri.parse('$baseUrl/runs/finish/$currentRunId'), body: jsonEncode({
      'duration': duration.inSeconds,
    }), headers: {
      "Content-Type": "application/json",
    });
  }
}
