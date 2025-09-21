// lib/screens/language_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Language')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('English', style: GoogleFonts.inter()),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          ListTile(
            title: Text('Hindi', style: GoogleFonts.inter()),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          ListTile(
            title: Text('Telugu', style: GoogleFonts.inter()),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
