import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';
import 'package:portfolio/app/helpers/widgets/mobile/about_section_mobile.dart';
import 'package:portfolio/app/helpers/widgets/mobile/contact_section_mobile.dart';
import 'package:portfolio/app/helpers/widgets/mobile/experience_section_mobile.dart';
import 'package:portfolio/app/helpers/widgets/mobile/project_section_mobile.dart';
import 'package:portfolio/app/helpers/widgets/mobile/hero_section_mobile.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "Sourav",
          style: theme.bodyMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            color: Colors.white,
            surfaceTintColor: Colors.transparent,

            onSelected: (index) {
              switch (index) {
                case 0:
                  scrollToSection(homeKey);
                  break;
                case 1:
                  scrollToSection(aboutKey);
                  break;
                case 2:
                  scrollToSection(projectsKey);
                  break;
                case 3:
                  scrollToSection(experienceKey);
                  break;
                case 4:
                  scrollToSection(contactKey);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  "Home",
                  style: theme.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(
                  "About",
                  style: theme.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Projects",
                  style: theme.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Text(
                  "Experience",
                  style: theme.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 4,
                child: Text(
                  "Contact",
                  style: theme.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(key: homeKey, child: const HeroSectionMobile()),
            Container(key: aboutKey, child: const AboutSectionMobile()),
            Container(key: projectsKey, child: const ProjectsSectionMobile()),
            Container(
              key: experienceKey,
              child: const ExperienceSectionMobile(),
            ),
            Container(key: contactKey, child: const ContactSectionMobile()),
          ],
        ),
      ),
    );
  }
}
