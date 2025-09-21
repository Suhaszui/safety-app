import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  void acceptAndContinue(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Before You Begin',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade800,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This Smart Safety App is designed to protect and empower you during your travels. Please read the following carefully:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text('Your location will be tracked for safety.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text('You can trigger SOS alerts anytime.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text('Your itinerary helps us detect deviations.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title:
                        Text('Emergency contacts may be notified if needed.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text(
                        'You can control privacy and data sharing anytime.'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'By continuing, you agree to the app’s Terms & Conditions and Privacy Policy.',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => acceptAndContinue(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child:
                    Text('Accept & Continue', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
