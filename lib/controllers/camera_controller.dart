import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CameraControl extends GetxController {
  var cameras = Rx<List<CameraDescription>?>(null);
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';

  Future<String?> getWasteClassification(int userId, File file) async {
    final uri = Uri.parse("$_baseURL/detect/predict?userId=$userId");

    print(uri);
    try {
      var request = http.MultipartRequest('POST', uri);

      var multipartFile = await http.MultipartFile.fromPath(
        'file', // The key should match the API's expected parameter name
        file.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      request.headers.addAll({
        'accept': 'application/hal+json',
        'Content-Type': 'multipart/form-data',
      });

      var res = await request.send();

      print(res.statusCode);

      if (res.statusCode == 200) {
        // Optionally, parse the response here
        var responseData = await res.stream.toBytes();
        final jsonData = jsonDecode(utf8.decode(responseData));
        print(jsonData);
        return jsonData['class'];
      } else {
        print('Error: ${res.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<bool> sendRespond(int userId, String description, File file) async {
    final uri = Uri.parse(
        '$_baseURL/detect-response/send-response?userId=${userId}&description=${description}');

    try {
      var request = http.MultipartRequest('POST', uri);
      var multipartFile = await http.MultipartFile.fromPath(
        'file', // The key should match the API's expected parameter name
        file.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      request.headers.addAll({
        'accept': 'application/hal+json',
        'Content-Type': 'multipart/form-data',
      });

      var res = await request.send();

      print(res.statusCode);

      if (res.statusCode == 200) {
        // Optionally, parse the response here

        return true;
      } else {
        print('Error: ${res.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
