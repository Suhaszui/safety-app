import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'हिन्दी (Hindi)',
    'తెలుగు (Telugu)',
    'தமிழ் (Tamil)',
    'বাংলা (Bengali)',
    'ಕನ್ನಡ (Kannada)',
    'മലയാളം (Malayalam)',
    'ગુજરાતી (Gujarati)',
    'मराठी (Marathi)',
    'ਪੰਜਾਬੀ (Punjabi)',
    'اردو (Urdu)',
  ];

  void proceedToLogin() {
    // TODO: Save selected language if needed
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Language',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade800,
              ),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: (value) {
                if (value != null) setState(() => selectedLanguage = value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Language',
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: proceedToLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('Continue', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
