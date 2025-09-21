import 'package:flutter/material.dart';

class DeviationAlertScreen extends StatelessWidget {
  const DeviationAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String deviationMessage =
        '⚠️ You have deviated from your planned itinerary.\n\nLast check-in: Sep 21, 10:30 AM at Kailasagiri\nCurrent location: 3.2 km off route\n\nPlease return to your planned path or update your itinerary.';

    return Scaffold(
      appBar: AppBar(title: Text('Route Deviation')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.warning, color: Colors.orange, size: 60),
            SizedBox(height: 20),
            Text(deviationMessage, style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Update itinerary or notify emergency contact
              },
              child: Text('Update Itinerary'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Ignore alert
              },
              child: Text('Ignore'),
            ),
          ],
        ),
      ),
    );
  }
}
