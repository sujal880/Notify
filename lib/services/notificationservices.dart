import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> BackgroundHandler(RemoteMessage remotemessage) async {
  log("Message Received ${remotemessage.notification!.title}");
}

class NotificationService {
  Future<void> initialize() async {
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission();
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(BackgroundHandler);
      FirebaseMessaging.onMessage.listen((message) {
        log("Message Received ${message.notification!.title.toString()}");
      });
    }
  }
}
