import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/widgets/desktop/hero_section.dart';
import 'package:portfolio/app/modules/home/widgets/desktop/navbar.dart';

class HomeTabletView extends StatelessWidget {
  const HomeTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Navbar(),
            HeroSection(),
          ],
        ),
      ),
    );
  }
}
