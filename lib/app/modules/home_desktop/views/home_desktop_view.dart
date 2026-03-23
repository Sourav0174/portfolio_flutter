import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/widgets/desktop/about_section.dart';
import 'package:portfolio/app/helpers/widgets/desktop/contact_section.dart';
import 'package:portfolio/app/helpers/widgets/desktop/experience_section.dart';
import 'package:portfolio/app/helpers/widgets/desktop/project_section.dart';
import 'package:portfolio/app/helpers/widgets/desktop/hero_section.dart';
import 'package:portfolio/app/modules/home/widgets/desktop/navbar.dart';

class HomeDesktopView extends StatefulWidget {
  const HomeDesktopView({super.key});

  @override
  State<HomeDesktopView> createState() => _HomeDesktopViewState();
}

class _HomeDesktopViewState extends State<HomeDesktopView> {
  final homeKey = GlobalKey();

  final aboutKey = GlobalKey();

  final projectsKey = GlobalKey();

  final experienceKey = GlobalKey();

  final contactKey = GlobalKey();

  final scrollController = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      _updateCurrentSection();
    });
  }

  void _updateCurrentSection() {
    final sections = [
      homeKey,
      aboutKey,
      projectsKey,
      experienceKey,
      contactKey,
    ];

    for (int i = 0; i < sections.length; i++) {
      final context = sections[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position <= 150 && position >= -300) {
          if (currentIndex != i) {
            setState(() {
              currentIndex = i;
            });
          }
          break;
        }
      }
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Navbar(
              currentIndex: currentIndex,
              onMenuTap: (index) {
                setState(() => currentIndex = index);

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
            ),

            Container(key: homeKey, child: const HeroSection()),
            Container(key: aboutKey, child: const AboutSection()),
            Container(key: projectsKey, child: const ProjectsSection()),
            Container(key: experienceKey, child: const ExperienceSection()),
            Container(
              key: contactKey,
              child: ContactSection(
                onMenuTap: (index) {
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
