// lib/services/trip_manager.dart
import 'package:permission_handler/permission_handler.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'location_callback_handler.dart'; // Import the callback function

class TripManager {
  // 1. Ask the user for the necessary location permissions.
  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      // If they grant basic permission, also ask for "Always" permission for background tracking.
      await Permission.locationAlways.request();
    }
  }

  // 2. Start the background tracking service.
  void startTrip() async {
    await _requestLocationPermission();
    await BackgroundLocator.initialize();
    
    if (await BackgroundLocator.isServiceRunning()) {
      print("Trip service is already running.");
      return;
    }

    await BackgroundLocator.registerLocationUpdate(
      callback, // The top-level function from the other file
      settings: const LocatorSettings(
        androidSettings: AndroidSettings(
          accuracy: LocationAccuracy.HIGH,
          distanceFilter: 100, // Notify every 100 meters
          interval: 60,       // Check for updates every 60 seconds
          // This creates a persistent notification so the OS doesn't kill the service.
          notificationTitle: "Trip in Progress",
          notificationMsg: "Actively monitoring your safety.",
          notificationIcon: 'mipmap/ic_launcher', // Uses your default app icon
        ),
        iosSettings: IOSSettings(
          accuracy: LocationAccuracy.HIGH,
          distanceFilter: 100, // Notify every 100 meters
        ),
      ),
    );
     print("Trip started successfully!");
  }

  // 3. Stop the service.
  void stopTrip() {
    BackgroundLocator.unRegisterLocationUpdate();
    print("Trip stopped.");
  }
}