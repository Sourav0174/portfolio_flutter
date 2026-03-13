import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy - Paper Trading")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Privacy Policy for Paper Trading",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text("Last Updated: March 2026", style: TextStyle(fontSize: 16)),

            SizedBox(height: 40),

            Text(
              "Introduction",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "This Privacy Policy describes how the Paper Trading app "
              "collects, uses, and protects your information when using "
              "the application.",
            ),

            SizedBox(height: 30),

            Text(
              "Information We Collect",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We may collect account information, usage analytics, "
              "device data, and crash reports to improve the app experience.",
            ),

            SizedBox(height: 30),

            Text(
              "Third Party Services",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "The application may use third-party services such as Firebase "
              "for authentication, analytics, and performance monitoring.",
            ),

            SizedBox(height: 30),

            Text(
              "Contact",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "If you have any questions about this Privacy Policy, "
              "contact: Sourav Kumar.",
            ),
          ],
        ),
      ),
    );
  }
}
