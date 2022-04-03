import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchProvider with ChangeNotifier {
  Stopwatch _stopwatch;
  bool _isRunning = false;

  StopwatchProvider(this._stopwatch);

  Timer? notifier;

  void start() {
    _stopwatch.start();
    notifier = Timer.periodic(Duration(seconds:1), (timer) { notifyListeners(); });
    _isRunning = true;
    notifyListeners();
  }

  void stop() {
    _stopwatch.stop();
    notifier?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  set isRunning(bool value) {
    _isRunning = value;
    notifyListeners();
  }

  bool get isRunning => _isRunning;

  Duration get elapsedTime => _stopwatch.elapsed;
}