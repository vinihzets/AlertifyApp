import 'dart:developer';

import 'package:alertifyapp/core/services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingServices {
  NotificationService service;

  FirebaseMessagingServices(this.service);

  Future<void> initialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );
    await getDeviceFirebaseToken();

    FirebaseMessaging.onMessage.listen(_onMessage);
  }

  getDeviceFirebaseToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  _onMessage(RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    if (notification != null) {
      service.showLocalNotification(CustomNotification(
          id: message.hashCode,
          title: notification.title!,
          body: notification.body!));
    }
  }
}
