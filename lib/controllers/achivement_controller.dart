import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import '../models/achivements/achivement.dart';

class AchivementController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';

  final _achivementSubject = BehaviorSubject<List<Achivement>>();
  Stream<List<Achivement>> get achivementStream => _achivementSubject.stream;

  @override
  void onInit() {
    super.onInit();
    fetchAchievements();
    Timer.periodic(Duration(seconds: 5), (timer) {
      fetchAchievements();
    });
  }

  Future<void> fetchAchievements() async {
    final uri = Uri.parse('$_baseURL/achievement');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        List<Achivement> responseAchievements = jsonData.map((element) {
          final id = element['id'];
          final type = element['type'];
          return Achivement(id: id, type: type);
        }).toList();

        _achivementSubject.add(responseAchievements);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _achivementSubject.close();
    super.dispose();
  }
}
