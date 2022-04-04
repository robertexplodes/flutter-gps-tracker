import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpstracking/domain/run.dart';
import 'package:http/http.dart' as http;

class RunProvider with ChangeNotifier {
  final String _baseUrl = "http://10.0.2.2:8080";

  List<Run> _runs = [];

  List<Run> get runs => _runs;

  void addRun(Run run) {
    _runs.add(run);
    notifyListeners();
  }

  Future<List<Run>> loadRuns() async {
    try {
      var response = await http.get(Uri.parse("$_baseUrl/runs"));
      var data = jsonDecode(response.body) as List<dynamic>;

      var runs = data.map((e) => Run.fromJson(e)).toList();
      _runs = runs;
      notifyListeners();
    } catch(error) {
      print(error);
    }
    return [];
  }

}

