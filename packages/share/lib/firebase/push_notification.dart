import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

//ignore_for_file: lines_longer_than_80_chars
//ignore_for_file: avoid_redundant_argument_values

/// local notification service
class LocalNotificationService {
  static final _fcm = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// id notification channel
  static const String channelId = 'hard code';

  /// name notification channel
  static const String channelName = 'hard code';

  /// description notification channel
  static const String channelDescription =
      'This channel is used for important notifications.';

  final StreamController<RemoteMessage?> _onNotification =
      StreamController.broadcast();

  /// stream when
  Stream<RemoteMessage?> get onNotification =>
      _onNotification.stream.where((event) => event != null);

  /// Create chanel
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    channelId, // id
    channelName, // title
    description: channelDescription, // description
    importance: Importance.max,
    playSound: true,
    showBadge: true,
    enableLights: true,
    enableVibration: true,
  );

  /// ================================================================
  ///  Get FCM token
  ///
  ///
  /// ================================================================
  Future<String> getFCMToken() async {
    try {
      return await _fcm.getToken() ?? '';
    } on FirebaseException {
      return '';
    }
  }

  /// ================================================================
  ///  Get APNS token
  ///
  ///
  /// ================================================================
  Future<String> getAPNSToken() async {
    try {
      return await _fcm.getAPNSToken() ?? '';
    } on FirebaseException {
      return '';
    }
  }

  /// ================================================================
  ///  Get token
  ///
  ///
  /// ================================================================

  Future<String> getToken() async {
    try {
      // get fcm token from device
      return getFCMToken();
    } on FirebaseException {
      return '';
    }
  }

  @pragma('vm:entry-point')
  static void _notificationTapBackground(
    NotificationResponse notificationResponse,
  ) {
    debugPrint(
      'Notification tapped: ${notificationResponse.actionId} with payload: ${notificationResponse.payload}',
    );

    if (notificationResponse.input?.isNotEmpty ?? false) {
      if (kDebugMode) {
        print(
          'Notification action tapped with input: ${notificationResponse.input}',
        );
      }
    }
  }

  /// ================================================================
  ///  Setup Local Notifications
  ///
  ///
  /// ================================================================

  Future<void> _initLocalNotifications() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) =>
          _onSelectLocalNotification(details.payload),
      onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
    );
  }

  /// ================================================================
  ///  on tap select local notification
  ///
  ///
  /// ================================================================

  Future<dynamic> _onSelectLocalNotification(String? payload) async {
    if (payload == null) return;
    // _redirectToThePage();
  }

  /// Navigator to screen by type
  static Future<void> navigatorToScreenByTypeNotification(
    String? dataMessage,
  ) async {
    debugPrint('navigatorToScreenByTypeNotification');
  }

  /// ================================================================
  ///  show local notification
  ///
  ///
  /// ================================================================
  ///
  static Future<void> showLocalNotification(
    int notificationId,
    String? notificationTitle,
    String? notificationContent,
    String payload,
  ) async {
    const notificationPriority = Priority.high;
    const notificationImportance = Importance.max;

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: notificationImportance,
      priority: notificationPriority,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  /// ================================================================
  /// Setup Remote Notifications
  ///
  ///
  /// ================================================================

  Future<void> initFirebaseMessaging() async {
    await _fcm.setAutoInitEnabled(false);

    await _fcm.requestPermission();

    final status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }

    await _fcm.setForegroundNotificationPresentationOptions(
      sound: true,
      badge: true,
      alert: true,
    );

    /// Continuosaly Listening to notification using [onMessage] stream
    if (status.isGranted) {
      await _initLocalNotifications();
      await _setupRemoteMessageListener();
    }

    /// from terminate mode, app launch when click the push notification banner
    await _fcm.getInitialMessage().then((RemoteMessage? message) async {
      if (message == null) return;
      _redirectToThePage(message);
    });
  }

  Future<void>? _setupRemoteMessageListener() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // from foreground usually won't have the push notification banner display
    // we need to use the local notification plugin to display
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      _onNotification.add(message);

      if (message == null || message.notification == null) return;

      await showLocalNotification(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        jsonEncode({'data': message.data}),
      );
    });

    // Handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
      if (message == null) return;
      _redirectToThePage(message);
    });

    return null;
  }

  void _redirectToThePage(RemoteMessage message) {}
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await LocalNotificationService.showLocalNotification(
    message.notification.hashCode,
    message.notification?.title,
    message.notification?.body,
    jsonEncode({'data': message.data}),
  );
}
