import 'package:coffee_shop/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationProvider with ChangeNotifier {
  final List<NotificationModel> notifications = [];
  String getCurrentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM d, yyyy');
    final String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getCurrentTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('h:mm a');
    final String formattedTime = formatter.format(now);
    return formattedTime;
  }

  void orderSuccessNotification() {
    NotificationModel addNotification = NotificationModel(
        notificationTitle: 'Your coffee order has been Placed',
        notificationMsg: 'Your order is been processed',
        date: getCurrentDate(),
        timeOfDay: getCurrentTime());
    notifications.add(addNotification);
    notifyListeners();
  }

  clearNotifications() async {
    notifications.clear();
    notifyListeners();
  }
}
