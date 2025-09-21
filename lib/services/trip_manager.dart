import 'package:permission_handler/permission_handler.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'location_callback_handler.dart';

class TripManager {
  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      await Permission.locationAlways.request();
    }
  }

  void startTrip() async {
    await _requestLocationPermission();
    await BackgroundLocator.initialize();

    if (await BackgroundLocator.isServiceRunning()) {
      print("Trip service is already running.");
      return;
    }

    await BackgroundLocator.registerLocationUpdate(callback,
        androidSettings: const AndroidSettings(
          accuracy: LocationAccuracy.HIGH,
          interval: 60,
          distanceFilter: 100,

          // This is the correct structure: a nested object for notification settings
          androidNotificationSettings: AndroidNotificationSettings(
            notificationChannelName: 'Location Tracking',
            notificationTitle: "Trip in Progress",
            notificationMsg: "Actively monitoring your safety.",
            notificationIcon: 'mipmap/ic_launcher',
          ),
        ),
        iosSettings: const IOSSettings(
          accuracy: LocationAccuracy.HIGH,
          distanceFilter: 100,
          showsBackgroundLocationIndicator: true,
        ));
    print("Trip started successfully!");
  }

  void stopTrip() {
    BackgroundLocator.unRegisterLocationUpdate();
    print("Trip stopped.");
  }
}
