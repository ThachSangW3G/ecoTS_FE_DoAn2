import 'dart:convert';

import 'package:ecots_fe/models/ranks/user_rank.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/ranks/rank.dart';
import '../services/api_service.dart';

class RankController extends GetxController {
  final ApiService _apiService = ApiService();

  RxList<Rank> ranks = <Rank>[].obs;

  Future<UserRank?> getUserRank(int idUser) async {
    final uri = Uri.parse('${_apiService.baseUrl}/rank/user/$idUser');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        final userRank = UserRank.fromJson(jsonData);
        return userRank;
      } else {
        throw Exception('Failed to get user rank');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getAllRanks() async {
    final uri = Uri.parse('${_apiService.baseUrl}/rank');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        final List<Rank> responseRanks =
            jsonData.map<Rank>((rank) => Rank.fromJson(rank)).toList();
        ranks.assignAll(responseRanks);
      } else {
        throw Exception('Failed to get ranks');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Rank> getNextRank(int currentRankId) async {
    var currentRank = ranks.where((rank) => rank.id == currentRankId).first;
    var index = ranks.indexOf(currentRank);
    if (index < ranks.length - 1) {
      return ranks[index + 1];
    } else {
      return currentRank;
    }
  }
}
