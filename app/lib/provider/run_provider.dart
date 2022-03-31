import 'package:flutter/material.dart';
import 'package:gpstracking/domain/run.dart';

class RunProvider with ChangeNotifier {
  List<Run> _runs = [Run(3601, 2000, DateTime.now())];

  List<Run> get runs => _runs;

  void addRun(Run run) {
    _runs.add(run);
    notifyListeners();
  }
}