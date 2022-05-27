import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tidiii/models/energy_data.dart';

class EnergyDataService {
  final String _urlFindLastRecord = "http://192.168.1.2:8080/energy/last";

  Future<EnergyData> findAll() async {
    final response =
        await http.get(Uri.parse(_urlFindLastRecord));

    if (response.statusCode != 200) {
      throw Exception("Error");
    }

    return EnergyData.fromJson(jsonDecode(response.body));
  }
}