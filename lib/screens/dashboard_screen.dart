import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String touristName = 'Manisha';
    final String tripValidity = 'Valid until Sep 30, 2025';
    final int safetyScore = 82; // Example score

    Color scoreColor = safetyScore >= 80
        ? Colors.green
        : safetyScore >= 50
            ? Colors.orange
            : Colors.red;

    return Scaffold(
      appBar: AppBar(title: Text('Welcome, $touristName')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Add your image
            ),
            SizedBox(height: 10),
            Text(tripValidity, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Safety Score: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: scoreColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('$safetyScore',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildTile(context, Icons.play_arrow, 'Start Trip', '/start'),
                  _buildTile(context, Icons.map, 'Itinerary', '/itinerary'),
                  _buildTile(context, Icons.warning, 'Panic Button', '/panic'),
                  _buildTile(context, Icons.location_on, 'Live Map', '/map'),
                  _buildTile(context, Icons.settings, 'Settings', '/settings'),
                  _buildTile(context, Icons.map, 'Live Map', '/map'),
                  _buildTile(context, Icons.warning, 'Panic', '/panic'),
                  _buildTile(context, Icons.list, 'Itinerary', '/itinerary'),
                  _buildTile(context, Icons.settings, 'Settings', '/settings'),
                  _buildTile(context, Icons.privacy_tip, 'Privacy', '/privacy'),
                  _buildTile(context, Icons.person, 'Profile', '/profile'),
                  _buildTile(context, Icons.help, 'Help', '/help'),
                  _buildTile(context, Icons.exit_to_app, 'End Trip', '/end'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.deepPurple),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
