import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/widgets/about_section.dart';
import 'package:portfolio/app/helpers/widgets/contact_section.dart';
import 'package:portfolio/app/helpers/widgets/experience_section.dart';
import 'package:portfolio/app/modules/home/widgets/hero_section.dart';
import 'package:portfolio/app/modules/home/widgets/navbar.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            HeroSection(),
            AboutSection(),
            ExperienceSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
