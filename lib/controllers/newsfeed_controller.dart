import 'dart:convert';
import 'dart:io';

import 'package:ecots_fe/models/comments/comment.dart';
import 'package:ecots_fe/models/newsfeeds/newsfeed.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

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

  Future<List<Newsfeed>> getYourNewsfeed(int userId) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/get-your-activity?userId=$userId');
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

  Future<bool> createNewsfeed(
      {required String content,
      required int userId,
      required List<String> pollOptions,
      required DateTime startedAt,
      required DateTime endedAt,
      required List<File> files}) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/create?content=$content&userId=$userId&pollOptions=$pollOptions&startedAt=${DateFormat('yyyy-MM-dd HH:mm:ss').format(startedAt)}&endedAt=${DateFormat('yyyy-MM-dd HH:mm:ss').format(endedAt)}');
    final request = http.MultipartRequest('POST', uri)
      ..headers['accept'] = 'application/hal+json'
      ..headers['Content-Type'] = 'multipart/form-data';

    // Thêm file vào request
    for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath(
        'files',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));
    }

    try {
      final response = await request.send();
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

  Future<bool> getReactStatus(int newsfeedId, int userId) async {
    final uri = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/$newsfeedId/react-status?userId=$userId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonData as bool;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateReact(int newsfeedId, int userId) async {
    final url = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/$newsfeedId/reacts/update?userId=$userId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.put(url, headers: headers);
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

  Future<bool> createReact(int newsfeedId, int userId) async {
    final url = Uri.parse(
        '${_apiService.baseUrl}/newsfeed/$newsfeedId/reacts?userId=$userId&status=true');
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

  Future<int> countReacts(int newsfeedId) async {
    final url =
        Uri.parse('${_apiService.baseUrl}/newsfeed/$newsfeedId/reacts/count');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as int;
        return jsonData;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<int> countComments(int newsfeedId) async {
    final url =
        Uri.parse('${_apiService.baseUrl}/newsfeed/$newsfeedId/comments/count');
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as int;
        return jsonData;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
