import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSectionMobile extends StatelessWidget {
  const AboutSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TITLE (CLEAN)
          const Text(
            "About",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ).animate().fadeIn().slideY(begin: 0.2),

          const SizedBox(height: 16),

          /// 💡 HEADLINE (STRONG TYPOGRAPHY)
          Text(
            "I build fast, scalable\nand intelligent apps.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.2,
              color: Color(0xFF111111), // 🔥 important
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),

          const SizedBox(height: 12),

          /// 🧠 DESCRIPTION
          const Text(
            "I'm Sourav — a Flutter developer focused on performance, clean architecture and scalable systems.\n"
            "I create apps that feel smooth, fast and premium.\n"
            "Currently exploring AI + backend to build intelligent products.",
            style: TextStyle(fontSize: 15, height: 1.7, color: Colors.black87),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 40),

          /// 🖼️ IMAGE + INFO CARD (NEW STYLE)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    /// IMAGE
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/images/potrait.jpg",
                        height: 600,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// INFO
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          /// NAME + ROLE
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sourav Kumar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Flutter Developer • AI Explorer",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// STATUS DOT
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.25),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),

          const SizedBox(height: 30),

          /// 🛠️ TECH TITLE
          const Text(
            "Tech & Tools",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 16),

          /// 🧩 CLEAN TECH GRID
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _Chip("Flutter"),
              _Chip("Firebase"),
              _Chip("FastAPI"),
              _Chip("Python"),
              _Chip("MongoDB"),
              _Chip("PostgreSQL"),
              _Chip("Docker"),
              _Chip("Stripe"),
              _Chip("Postman"),
              _Chip("GitHub"),
            ].animate(interval: 60.ms).fadeIn(),
          ),
        ],
      ),
    );
  }
}

/// 💎 MINIMAL CHIP (BETTER THAN HEAVY BADGES)
class _Chip extends StatelessWidget {
  final String text;
  const _Chip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(color: Colors.black12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }
}
