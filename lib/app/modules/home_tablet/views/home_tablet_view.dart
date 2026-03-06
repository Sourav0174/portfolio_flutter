import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/home/widgets/hero_section.dart';
import 'package:portfolio/app/modules/home/widgets/navbar.dart';

class HomeTabletView extends StatelessWidget {
  const HomeTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: const [Navbar(), HeroSection()]),
      ),
    );
  }
}
