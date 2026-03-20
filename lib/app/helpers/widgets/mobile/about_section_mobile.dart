import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/widgets/desktop/about_section.dart';

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
          /// 🔥 TITLE
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
            ).createShader(bounds),
            child: const Text(
              "About Me",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// 💡 HEADLINE
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: "I build "),
                TextSpan(
                  text: "fast, scalable",
                  style: TextStyle(color: Color(0xFF2F4F4F)),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "intelligent",
                  style: TextStyle(color: Color(0xFF2F4F4F)),
                ),
                TextSpan(text: " apps."),
              ],
            ),
          ).animate().fadeIn().slideY(begin: 0.2),

          const SizedBox(height: 16),

          /// 🧠 DESCRIPTION
          const Text(
            "I'm Sourav — a Flutter developer focused on performance, clean architecture and scalable systems.\n\n"
            "I love building apps that not only work — but feel smooth and premium.\n\n"
            "Currently exploring AI + backend to build intelligent full-stack products.",
            style: TextStyle(fontSize: 14, height: 1.7, color: Colors.black87),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 30),

          /// 🖼️ IMAGE CARD (SIMPLIFIED VERSION)
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage("assets/images/potrait.jpg"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                ),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sourav Kumar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Flutter • AI Explorer",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 300.ms).scale(),

          const SizedBox(height: 30),

          /// 🛠️ TECH STACK
          const Text(
            "Tech & Tools",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              TechBadge(
                title: "Flutter",
                imagePath: "assets/techIcons/flutter.png",
                color: Color(0XFF02569B),
              ),
              TechBadge(
                title: "Firebase",
                imagePath: "assets/techIcons/firebase.png",
                color: Color(0XFFFFA611),
              ),
              TechBadge(
                title: "FastAPI",
                imagePath: "assets/techIcons/fastapi.png",
                color: Color(0XFF3C873A),
              ),
              TechBadge(
                title: "Python",
                imagePath: "assets/techIcons/python.png",
                color: Color(0XFF3C873A),
              ),
              TechBadge(
                title: "MongoDB",
                imagePath: "assets/techIcons/mongodb.png",
                color: Color(0XFF47A248),
              ),
              TechBadge(
                title: "PostgreSQL",
                imagePath: "assets/techIcons/postgresql.png",
                color: Color(0XFF47A248),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
