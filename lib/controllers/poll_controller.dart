import 'dart:convert';

import 'package:ecots_fe/models/polls/poll.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import 'package:http/http.dart' as http;

class PollController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<Poll> getPoll(int idNewsfeed) async {
    final url =
        Uri.parse('${_apiService.baseUrl}/poll/by-newsfeed/$idNewsfeed');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return Poll.fromJson(jsonData);
      } else {
        throw Exception('Failed to get poll');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to get poll');
    }
  }

  Future<int?> getVoteId(int userId, int newsfeedId) async {
    final url = Uri.parse(
        '${_apiService.baseUrl}/poll/get-vote-id?userId=$userId&newsfeedId=$newsfeedId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonData as int;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> deleteVote(int newsfeedId, int pollOptionId, int voteId) async {
    final url = Uri.parse(
        '${_apiService.baseUrl}/poll/$newsfeedId/$pollOptionId/votes/$voteId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.delete(url, headers: headers);
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

  Future<bool> votePoll(int newsfeedId, int pollOptionId, int userId) async {
    final url = Uri.parse(
        '${_apiService.baseUrl}/poll/$newsfeedId/$pollOptionId/votes?userId=$userId&status=true');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, headers: headers);
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
