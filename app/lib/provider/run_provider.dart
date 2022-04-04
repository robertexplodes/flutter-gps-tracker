import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpstracking/domain/run.dart';
import 'package:http/http.dart' as http;

class RunProvider with ChangeNotifier {
  final String _baseUrl = "http://10.0.2.2:8080";

  List<Run> _runs = [
    Run(1,3601, 2000, DateTime.now()),
    Run(2,3601, 2000, DateTime.now()),
    Run(3,3601, 2000, DateTime.now()),
    Run(4,3601, 2000, DateTime.now()),
    Run(5,3601, 2000, DateTime.now()),
    Run(6,3601, 2000, DateTime.now()),
    Run(7,3601, 2000, DateTime.now()),
    Run(8,3601, 2000, DateTime.now()),
    Run(9,3601, 2000, DateTime.now()),
    Run(10,3601, 2000, DateTime.now()),
    Run(11,3601, 2000, DateTime.now()),
    Run(12,3601, 2000, DateTime.now()),
    Run(13,3601, 2000, DateTime.now()),
  ];

  List<Run> get runs => _runs;

  void addRun(Run run) {
    _runs.add(run);
    notifyListeners();
  }

  Future<List<Run>> loadRuns() async {
    print("here");
    try {
      var response = await http.get(Uri.parse("$_baseUrl/runs"));
      var data = jsonDecode(response.body) as List<dynamic>;

      print(data);
    } catch(error) {
      print(error);
    }
    return [];
  }

}

