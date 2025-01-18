import 'dart:typed_data';

import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/api_service.dart';

class GenerateBarcodeController extends GetxController {
  final ApiService _apiService = ApiService();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var barCode = Rx<Uint8List?>(null);

  UserController userController = Get.put(UserController());

  Future<void> genenerateBarcode() async {
    print(123);
    final prefs = await _prefs;
    final username = prefs.getString('username');
    final email = userController.currentUser.value!.email!;

    final uri = Uri.parse(
        '${_apiService.baseUrl}/generate/generate-qrcode?username=$username&email=$email');

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      barCode.value = response.bodyBytes;
    } catch (e) {
      print(e);
    }
  }
}
