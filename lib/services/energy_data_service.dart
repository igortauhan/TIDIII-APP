import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tidiii/models/energy_data.dart';

class EnergyDataService {
  final String _urlFindAll = "http://192.168.1.2:8080/energy";

  Future<List<EnergyData>> findAll() async {
    final response =
        await http.get(Uri.parse(_urlFindAll));

    if (response.statusCode != 200) {
      throw Exception("Error");
    }

    Iterable iterable = json.decode(response.body);
    List<EnergyData> energyData = List<EnergyData>
        .from(iterable.map((energy) => EnergyData.fromJson(energy)));

    return energyData;
  }
}