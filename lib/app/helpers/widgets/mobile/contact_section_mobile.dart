import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/widgets/desktop/contact_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSectionMobile extends StatelessWidget {
  const ContactSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TITLE
          const Text(
            "Let’s Build Something Amazing 🚀",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Have a project, startup idea, or just want to collaborate? "
            "I'm always open to meaningful conversations.",
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.white.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 30),

          /// 📩 CONTACT FORM
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.05),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: const ContactForm(),
          ),

          const SizedBox(height: 30),

          /// 🔗 SOCIAL LINKS
          const Text(
            "Connect With Me",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 15),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              SocialButtonMobile(
                label: "Email",
                url: "mailto:info.sourav@gmail.com",
              ),
              SocialButtonMobile(
                label: "LinkedIn",
                url: "https://www.linkedin.com/in/sourav-791120257/",
              ),
              SocialButtonMobile(
                label: "GitHub",
                url: "https://github.com/Sourav0174",
              ),
              SocialButtonMobile(
                label: "LeetCode",
                url: "https://leetcode.com/u/sourav781/",
              ),
              SocialButtonMobile(
                label: "Instagram",
                url: "https://www.instagram.com/sourav17_official/",
              ),
              SocialButtonMobile(
                label: "WhatsApp",
                url:
                    "https://wa.me/919041618674?text=Hi%20Sourav%2C%20I%20visited%20your%20portfolio!",
              ),
            ],
          ),

          const SizedBox(height: 40),

          /// 🧾 FOOTER
          const Divider(color: Colors.white24),

          const SizedBox(height: 20),

          Center(
            child: Text(
              "© 2026 Sourav — Built with Flutter",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButtonMobile extends StatelessWidget {
  final String label;
  final String url;

  const SocialButtonMobile({super.key, required this.label, required this.url});

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.08),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
