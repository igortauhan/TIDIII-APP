import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tidiii/models/energy_data.dart';

class EnergyDataService {
  final String _urlFindLastRecord = "http://192.168.1.2:8080/energy/last";

  String _urlGetCurrentSpentValue =
      "http://192.168.1.2:8080/storaged/current-spent";

  Future<EnergyData> findAll() async {
    final response =
        await http.get(Uri.parse(_urlFindLastRecord));

    if (response.statusCode != 200) {
      throw Exception("Error");
    }

    return EnergyData.fromJson(jsonDecode(response.body));
  }

  Future<int> getCurrentSpentValueMonth(int? value) async {
    _urlGetCurrentSpentValue += "?value=$value&hours=24&days=30";

    final response =
        await http.get(Uri.parse(_urlGetCurrentSpentValue));

    if (response.statusCode !=200) {
      throw Exception("Error");
    }

    value =  jsonDecode(response.body);

    if (value == null) {
      return 0;
    }

    return value ~/ 100000;
  }
}