import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/donations/donation.dart';
import '../services/api_service.dart';

class DonationController extends GetxController {
  final ApiService _apiService = ApiService();

  var donationList = Rx<List<Donation>?>(null);
  var upcomingDonationList = Rx<List<Donation>?>(null);
  var ongoingDonationList = Rx<List<Donation>?>(null);
  var endedDonationList = Rx<List<Donation>?>(null);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getAllDonations() async {
    final uri = Uri.parse('${_apiService.baseUrl}/donate/get-all-donations');
    final headers = {'Content-Type': 'application/json'};

    //donationList.value.clear();

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        print(jsonData);
        List<Donation> responseListDonation = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final title = element['title'];
          final description = element['description'];
          List<String> sponsorImages = [];
          element['sponsorImages'].forEach((image) {
            sponsorImages.add(image.toString());
          });

          List<String> coverImageUrl = [];
          element['coverImageUrl'].forEach((image) {
            coverImageUrl.add(image.toString());
          });

          final totalDonations = element['totalDonations'];

          final startDate =
              DateTime.fromMillisecondsSinceEpoch(element['startDate']);
          final endDate =
              DateTime.fromMillisecondsSinceEpoch(element['endDate']);

          final donation = Donation(
            id: id,
            title: title,
            description: description,
            sponsorImages: sponsorImages,
            coverImageUrl: coverImageUrl,
            totalDonations: totalDonations,
            startDate: startDate,
            endDate: endDate,
          );

          responseListDonation.add(donation);
        });

        donationList.value = responseListDonation;
      }

      print('-----');
      print(donationList.value);
      print('-----');
    } catch (e) {
      print(e);
    }
  }

  Future<bool> donatePoint(int points, int donationId) async {
    final prefs = await _prefs;

    final token = prefs.getString('tokenAccess');

    final uri = Uri.parse(
        '${_apiService.baseUrl}/donate/donate-points?Token=$token&donationId=$donationId&points=$points');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Donation?> getDonationById(int id) async {
    final uri =
        Uri.parse('${_apiService.baseUrl}/donate/get-donation-by-id?id=$id');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

        final id = jsonData['id'];
        final title = jsonData['title'];
        final description = jsonData['description'];
        List<String> sponsorImages = [];
        jsonData['sponsorImages'].forEach((image) {
          sponsorImages.add(image.toString());
        });

        List<String> coverImageUrl = [];
        jsonData['coverImageUrl'].forEach((image) {
          coverImageUrl.add(image.toString());
        });

        final startDate =
            DateTime.fromMillisecondsSinceEpoch(jsonData['startDate']);
        final endDate =
            DateTime.fromMillisecondsSinceEpoch(jsonData['endDate']);

        final totalDonations = jsonData['totalDonations'];

        final donation = Donation(
          id: id,
          title: title,
          description: description,
          sponsorImages: sponsorImages,
          coverImageUrl: coverImageUrl,
          totalDonations: totalDonations,
          startDate: startDate,
          endDate: endDate,
        );

        return donation;
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getOngoingDonations() async {
    final uri = Uri.parse('${_apiService.baseUrl}/donate/ongoing');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        List<Donation> responseListDonation = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final title = element['title'];
          final description = element['description'];
          List<String> sponsorImages = [];
          element['sponsorImages'].forEach((image) {
            sponsorImages.add(image.toString());
          });

          List<String> coverImageUrl = [];
          element['coverImageUrl'].forEach((image) {
            coverImageUrl.add(image.toString());
          });

          final totalDonations = element['totalDonations'];

          final startDate =
              DateTime.fromMillisecondsSinceEpoch(element['startDate']);
          final endDate =
              DateTime.fromMillisecondsSinceEpoch(element['endDate']);

          final donation = Donation(
            id: id,
            title: title,
            description: description,
            sponsorImages: sponsorImages,
            coverImageUrl: coverImageUrl,
            totalDonations: totalDonations,
            startDate: startDate,
            endDate: endDate,
          );

          responseListDonation.add(donation);
        });

        ongoingDonationList.value = responseListDonation;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUpcomingDonations() async {
    final uri = Uri.parse('${_apiService.baseUrl}/donate/upcoming');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        List<Donation> responseListDonation = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final title = element['title'];
          final description = element['description'];
          List<String> sponsorImages = [];
          element['sponsorImages'].forEach((image) {
            sponsorImages.add(image.toString());
          });

          List<String> coverImageUrl = [];
          element['coverImageUrl'].forEach((image) {
            coverImageUrl.add(image.toString());
          });

          final totalDonations = element['totalDonations'];

          final startDate =
              DateTime.fromMillisecondsSinceEpoch(element['startDate']);
          final endDate =
              DateTime.fromMillisecondsSinceEpoch(element['endDate']);

          final donation = Donation(
            id: id,
            title: title,
            description: description,
            sponsorImages: sponsorImages,
            coverImageUrl: coverImageUrl,
            totalDonations: totalDonations,
            startDate: startDate,
            endDate: endDate,
          );

          responseListDonation.add(donation);
        });

        upcomingDonationList.value = responseListDonation;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getEndedDonations() async {
    final uri = Uri.parse('${_apiService.baseUrl}/donate/ended');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        List<Donation> responseListDonation = [];
        jsonData.forEach((element) {
          final id = element['id'];
          final title = element['title'];
          final description = element['description'];
          List<String> sponsorImages = [];
          element['sponsorImages'].forEach((image) {
            sponsorImages.add(image.toString());
          });

          List<String> coverImageUrl = [];
          element['coverImageUrl'].forEach((image) {
            coverImageUrl.add(image.toString());
          });

          final totalDonations = element['totalDonations'];

          final startDate =
              DateTime.fromMillisecondsSinceEpoch(element['startDate']);
          final endDate =
              DateTime.fromMillisecondsSinceEpoch(element['endDate']);

          final donation = Donation(
            id: id,
            title: title,
            description: description,
            sponsorImages: sponsorImages,
            coverImageUrl: coverImageUrl,
            totalDonations: totalDonations,
            startDate: startDate,
            endDate: endDate,
          );

          responseListDonation.add(donation);
        });

        endedDonationList.value = responseListDonation;
      }
    } catch (e) {
      print(e);
    }
  }
}
