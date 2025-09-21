import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool accepted = false;

  final List<String> terms = [
    'You agree to share your location for emergency tracking.',
    'You will use the panic alert feature responsibly.',
    'You acknowledge that Smart Safety is not a substitute for local law enforcement.',
    'You will keep your itinerary updated for accurate monitoring.',
    'You agree to receive safety notifications and alerts.',
    'You understand that data is stored securely and used only for safety purposes.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.separated(
                        itemCount: terms.length,
                        separatorBuilder: (_, __) => Divider(height: 24),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle_outline,
                                  color: Color(0xFF2563EB)),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  terms[index],
                                  style: GoogleFonts.inter(
                                      fontSize: 15, color: Color(0xFF374151)),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: accepted,
                      onChanged: (value) =>
                          setState(() => accepted = value ?? false),
                    ),
                    Expanded(
                      child: Text(
                        'I accept the Terms & Conditions',
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: accepted
                        ? () => Navigator.pushNamed(context, '/instructions')
                        : null,
                    child: Text('CONTINUE'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
