import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/notifications/donate_point_model.dart';
import '../models/notifications/notification_model.dart';
import '../models/notifications/received_point_model.dart';

class NotificationController extends GetxController {
  final String _baseURL = 'https://ecotsbe-production.up.railway.app';
  var receivedPointList = Rx<List<ReceivedPointModel>?>(null);
  var donatePointList = Rx<List<DonatePointModel>?>(null);
  var notificationList = Rx<List<NotificationModel>?>(null);

  Future<void> getAllreceivedPoint(int userId) async {
    final uri = Uri.parse('$_baseURL/api/notifications/user/$userId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        final List<ReceivedPointModel> notifications = [];

        jsonData.forEach((element) {
          final id = element['id'];
          final points = element['points'];
          final exchangePointLocation = element['exchangePointLocation'];
          final userId = element['userId'];
          final DateTime createdAt =
              DateTime.fromMillisecondsSinceEpoch(element['createdAt']);
          final notification = ReceivedPointModel(
            id: id,
            points: points,
            exchangePointLocation: exchangePointLocation,
            userId: userId,
            createdAt: createdAt,
          );

          notifications.add(notification);
        });
        receivedPointList.value = notifications;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllDonatePoint(int userId) async {
    final uri =
        Uri.parse('$_baseURL/api/notifications/donation-history/$userId');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        final List<DonatePointModel> notifications = [];

        jsonData.forEach((element) {
          final id = element['id'];
          final points = element['points'];
          final donationLocation = element['donationLocation'];
          final userId = element['userId'];
          final DateTime createdAt =
              DateTime.fromMillisecondsSinceEpoch(element['createdAt']);
          final notification = DonatePointModel(
            id: id,
            points: points,
            donationLocation: donationLocation,
            userId: userId,
            createdAt: createdAt,
          );

          notifications.add(notification);
        });
        donatePointList.value = notifications;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllNotifications() async {
    final uri = Uri.parse('$_baseURL/api/notifications/notifications');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

        final List<NotificationModel> notifications = [];

        jsonData.forEach((element) {
          final id = element['id'];
          final title = element['title'];
          final description = element['description'];
          final DateTime createdAt =
              DateTime.fromMillisecondsSinceEpoch(element['createdAt']);
          final notification = NotificationModel(
            id: id,
            title: title,
            description: description,
            createdAt: createdAt,
          );

          notifications.add(notification);
        });
        notificationList.value = notifications;
      }
    } catch (e) {
      print(e);
    }
  }
}
