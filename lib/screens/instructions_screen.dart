// lib/screens/instructions_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instructions')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          '1. Choose your language.\n2. Login or sign up.\n3. Add trip details...\n4. Use panic button if needed.',
          style: GoogleFonts.inter(fontSize: 16),
        ),
      ),
    );
  }
}
