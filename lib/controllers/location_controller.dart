import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/locations/location.dart';
import '../services/api_service.dart';

class LocationController extends GetxController {
  final ApiService _apiService = ApiService();

  var locationList = Rx<List<Location>?>(null);

  Future<void> getAllLocations() async {
    final uri = Uri.parse('${_apiService.baseUrl}/location/get-all');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);
        List<Location> responseLocations = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final description = element['description'];
          final locationName = element['locationName'];
          final typeOfLocation = element['typeOfLocation'];
          final latitude = element['latitude'];
          final longitude = element['longitude'];
          final review = element['review'];
          final backGroundImgUrl = element['backGroundImgUrl'];

          List<String> imgDetailsUrl = [];
          element['imgDetailsUrl'].forEach((image) {
            imgDetailsUrl.add(image.toString());
          });

          final location = Location(
              id: id,
              description: description,
              locationName: locationName,
              typeOfLocation: typeOfLocation,
              latitude: latitude,
              longitude: longitude,
              review: review,
              backGroundImgUrl: backGroundImgUrl,
              imgDetailsUrl: imgDetailsUrl);

          responseLocations.add(location);
        });

        locationList.value = responseLocations;
      }

      print('-----');
      print(locationList.value);
      print('-----');
    } catch (e) {
      print(e);
    }
  }
}
