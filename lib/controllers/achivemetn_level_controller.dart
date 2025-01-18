import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import '../models/achivement_levels/achivement_level.dart';
import '../models/achivement_results/achivement_result.dart';
import '../models/achivements/achivement.dart';
import '../services/api_service.dart';

class AchivementLevelController extends GetxController {
  final ApiService _apiService = ApiService();

  final _achivementResultSubject = BehaviorSubject<List<AchivementResult>>();
  Stream<List<AchivementResult>> get achivementResultStream =>
      _achivementResultSubject.stream;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (userId != null) {
        fetchAchievementResults(userId!);
      }
    });
  }

  int? userId;

  Future<void> setUserId(int id) async {
    userId = id;
    await fetchAchievementResults(userId!);
  }

  Future<List<AchivementLevel>> getAchivementLevelsByAchievementId(
      Achivement achivement) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/achievement/get-achievement-level-by-achievement-id?achievementId=${achivement.id}');

    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        return jsonData.map((element) {
          final id = element['id'];
          final name = element['name'];
          final description = element['description'];
          final imgUrl = element['imgUrl'];
          final iconUrl = element['iconUrl'];
          final maxIndex = element['maxIndex'];

          return AchivementLevel(
              id: id,
              name: name,
              description: description,
              imgUrl: imgUrl,
              iconUrl: iconUrl,
              maxIndex: maxIndex,
              achivement: achivement);
        }).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> fetchAchievementResults(int userId) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/achievement/result/get-all-achievement-progress?userId=$userId');

    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        List<AchivementResult> responseList = jsonData.map((element) {
          final achievementLevelName = element['achievementLevelName'];
          final achievementLevelId = element['achievementLevelId'];
          final achievementId = element['achievementId'];
          final currentIndex = element['currentIndex'];
          final maxIndex = element['maxIndex'];
          final progress = element['progress'];
          final imgUrl = element['imgUrl'];
          final iconUrl = element['iconUrl'];

          return AchivementResult(
              achievementLevelName: achievementLevelName,
              achievementLevelId: achievementLevelId,
              achievementId: achievementId,
              currentIndex: currentIndex,
              maxIndex: maxIndex,
              progress: progress,
              imgUrl: imgUrl,
              iconUrl: iconUrl);
        }).toList();

        _achivementResultSubject.add(responseList);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _achivementResultSubject.close();
    super.dispose();
  }
}
