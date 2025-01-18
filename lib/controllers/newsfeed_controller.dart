import 'dart:convert';

import 'package:ecots_fe/models/comments/comment.dart';
import 'package:ecots_fe/models/newsfeeds/newsfeed.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import 'package:http/http.dart' as http;

class NewsfeedController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<List<Newsfeed>> getAllNewsfeed() async {
    final uri = Uri.parse('${_apiService.baseUrl}/newsfeed/getAll');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        return jsonData.map((element) => Newsfeed.fromJson(element)).toList();
      } else {
        throw Exception('Failed to get newsfeed');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Comment>> getComments(int newsfeedId) async {
    final uri =
        Uri.parse('${_apiService.baseUrl}/newsfeed/$newsfeedId/comments');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        return jsonData.map((element) => Comment.fromJson(element)).toList();
      } else {
        throw Exception('Failed to get comments');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> addComment(int idNewsfeed, String message, int userId) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/$idNewsfeed/comments?userId=$userId&message=$message');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(uri, headers: headers);
      if (response.statusCode == 200) {
        print('Comment added successfully');
      } else {
        throw Exception('Failed to add comment');
      }
    } catch (e) {
      print(e);
    }
  }
}
