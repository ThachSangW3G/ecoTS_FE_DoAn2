import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/points/point.dart';
import '../models/wastes/waste.dart';

class PointController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var currentPoint = Rx<Point?>(null);

  Future<void> getPointByToken() async {
    final prefs = await _prefs;
    final accessToken = prefs.getString('tokenAccess');

    final uri = Uri.parse('$_baseURL/point/get-user-point?token=$accessToken');

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        //print(responseData);
        currentPoint.value = Point.fromJson(responseData);
        print(currentPoint.value);
      }
    } catch (e) {}
  }

  Future<bool> exchangeTrashForm(String username, String email, int employeeId,
      List<TextEditingController> controllers, List<Waste> materials) async {
    Map<String, double> params = materials.asMap().map((key, value) {
      if (controllers[key].text.isEmpty) {
        return MapEntry(value.type, 0.0);
      }
      return MapEntry(value.type, double.parse(controllers[key].text));
    });

    String queryString =
        params.entries.map((entry) => '${entry.key}=${entry.value}').join('&');

    try {
      print(params);
      final uri = Uri.parse(
        '$_baseURL/point/admin/add-user-points-by-form?username=$username&email=$email&employeeId=$employeeId&$queryString',
      );

      final headers = {'Content-Type': 'application/json'};

      final response = await http.put(
        uri,
        headers: headers,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
