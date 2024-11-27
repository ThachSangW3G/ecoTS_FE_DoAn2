import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/wastes/waste.dart';

class WasteController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';

  var materialList = Rx<List<Waste>?>(null);

  Future<void> getAllMaterials() async {
    final uri = Uri.parse('$_baseURL/materials/get-all-materials');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);
        List<Waste> responseMaterials = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final name = element['name'];
          final pointsPerKg = element['pointsPerKg'];
          final co2SavedPerKg = element['co2SavedPerKg'];
          final type = element['type'];

          final material = Waste(
              id: id,
              name: name,
              pointsPerKg: pointsPerKg,
              co2SavedPerKg: co2SavedPerKg,
              type: type);

          responseMaterials.add(material);
        });

        materialList.value = responseMaterials;
      }

      print('-----');
      print(materialList.value);
      print('-----');
    } catch (e) {
      print(e);
    }
  }
}
