import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_safety_app/screens/deviation_alert_screen.dart';
import 'package:smart_safety_app/screens/end_trip_screen.dart';
import 'package:smart_safety_app/screens/help_screen.dart';
import 'package:smart_safety_app/screens/privacy_screen.dart';
import 'package:smart_safety_app/screens/signup_screen.dart';
import 'package:smart_safety_app/screens/terms_screen.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/language_screen.dart';
import 'screens/login_screen.dart';
import 'screens/instructions_screen.dart';
import 'screens/map_screen.dart';
import 'screens/itinerary_screen.dart';
import 'screens/panic_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFF2563EB);
  final Color backgroundColor = Color(0xFFF9FAFB);
  final Color textColor = Color(0xFF1F2937);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Safety App',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: textColor,
          displayColor: textColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      initialRoute: '/', // ✅ Start from splash
      routes: {
        '/': (context) => SplashScreen(),
        '/language': (context) => LanguageScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/terms': (context) => TermsScreen(),
        '/instructions': (context) => InstructionsScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/itinerary': (context) => ItineraryScreen(),
        '/map': (context) => MapScreen(),
        '/panic': (context) => PanicScreen(),
        '/settings': (context) => SettingsScreen(),
        '/privacy': (context) => PrivacyScreen(),
        '/profile': (context) => ProfileScreen(),
        '/help': (context) => HelpScreen(),
        '/end': (context) => EndTripScreen(),
        '/deviation': (context) => DeviationAlertScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
