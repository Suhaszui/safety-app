// lib/services/notification_service.dart
import 'package.firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // 1. Request permission from the user to show notifications
    await _fcm.requestPermission();

    // 2. Get the unique FCM token for this device and print it
    final fcmToken = await _fcm.getToken();
    print('🔑 FCM Registration Token: $fcmToken');
    // NOTE: This is the token you'll need for testing from the Firebase Console.

    // 3. Set up listeners to handle incoming notifications
    _setupListeners();
  }

  void _setupListeners() {
    // This listener handles messages that arrive when the app is OPEN and in the FOREGROUND
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title}');
      }
      
      // In a real app, you would show a custom in-app dialog or banner here.
    });

    // This listener handles what happens when the user TAPS on a notification
    // when the app was in the BACKGROUND or TERMINATED.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('User tapped on a notification to open the app!');
      print('Message data: ${message.data}');
      
      // Here, you would navigate the user to a relevant screen based on the data.
    });
  }
}