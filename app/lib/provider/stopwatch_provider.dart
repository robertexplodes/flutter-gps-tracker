import 'package:flutter/material.dart';

class StopwatchProvider with ChangeNotifier {
  Stopwatch _stopwatch;
  bool _isRunning = false;

  StopwatchProvider(this._stopwatch);

  void start() {
    _stopwatch.start();
    _isRunning = true;
  }

  void stop() {
    _stopwatch.stop();
    _isRunning = false;
  }

  set isRunning(bool value) {
    _isRunning = value;
    notifyListeners();
  }

  bool get isRunning => _isRunning;

  Duration get elapsedTime => _stopwatch.elapsed;
}