import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSectionMobile extends StatelessWidget {
  const HeroSectionMobile({super.key});

  final String resumeUrl =
      "https://drive.google.com/uc?export=download&id=1sT-pqTbXT8lJQSAsCKeUBMaAa4pmuZtP";

  Future<void> _downloadResume() async {
    final uri = Uri.parse(resumeUrl);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          /// 🔥 PROFILE WITH GLOW
          Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/profile2.png",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 600.ms)
              .scale(begin: const Offset(0.8, 0.8)),

          const SizedBox(height: 16),

          /// 👋 SMALL TEXT
          const Text(
            "Hey There 👋",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 6),

          /// 🔥 NAME
          const Text(
            "I’m Sourav",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),

          const SizedBox(height: 10),

          /// 💼 ROLE
          const Text(
            "Flutter Developer • AI Enthusiast",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 16),

          /// 🧠 DESCRIPTION
          const Text(
            "I build fast, scalable and production-ready apps with clean architecture.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.6, color: Colors.white70),
          ).animate().fadeIn(delay: 500.ms),

          const SizedBox(height: 20),

          /// 🟢 AVAILABLE BADGE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 10, color: Color(0XFFF3904F)),
                SizedBox(width: 8),
                Text(
                  "Available for work",
                  style: theme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),

          const SizedBox(height: 24),

          /// 🚀 CTA BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// DOWNLOAD
              ElevatedButton.icon(
                onPressed: _downloadResume,
                icon: const Icon(Icons.download),
                label: Text(
                  "Resume",
                  style: theme.bodyMedium!.copyWith(fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                ),
              ),

              // const SizedBox(width: 12),

              /// CONTACT
              // OutlinedButton(
              //   onPressed: () {},
              //   style: OutlinedButton.styleFrom(
              //     side: const BorderSide(color: Colors.white),
              //   ),
              //   child: const Text(
              //     "Contact",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
            ],
          ).animate().fadeIn(delay: 700.ms),
        ],
      ),
    );
  }
}
