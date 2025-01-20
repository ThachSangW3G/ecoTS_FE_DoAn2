import 'dart:convert';

import 'package:ecots_fe/models/rewards/reward.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import 'package:http/http.dart' as http;

class RewardController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<List<Reward>> getAllRewards() async {
    final uri = Uri.parse('${_apiService.baseUrl}/reward');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        return jsonData.map((element) {
          final id = element['id'];
          final rewardItemUrl = (element['rewardItemUrl'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [];
          final pointCharge = element['pointCharge'];
          final stock = element['stock'];
          final itemDescription = element['itemDescription'];
          final itemName = element['itemName'];
          final height = element['height'];
          final humidity = element['humidity'];
          final size = element['size'];
          final weight = element['weight'];
          final itemType = (element['itemType'] as List<dynamic>?)
                  ?.map((e) => int.tryParse(e.toString()) ?? 0)
                  .toList() ??
              [];
          return Reward(
              id: id,
              rewardItemUrl: rewardItemUrl,
              itemDescription: itemDescription,
              itemName: itemName,
              height: height,
              pointCharge: pointCharge,
              stock: stock,
              humidity: humidity,
              size: size,
              weight: weight,
              itemType: itemType);
        }).toList();
      } else {
        throw Exception('Failed to load rewards');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> updateRewardHistory(int userId, double point, int rewardItemId,
      int numberOfItem, String locationId) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/reward/update-reward-history?userId=$userId&point=$point&rewardItemId=$rewardItemId&numberOfItem=$numberOfItem&locationId=$locationId');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.put(uri, headers: headers);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
