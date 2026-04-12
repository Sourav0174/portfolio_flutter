import 'package:flutter/material.dart';

class HomeTabletView extends StatefulWidget {
  const HomeTabletView({super.key});

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  int currentIndex = 0;

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const Text(
                "Sourav",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              _navItem("Home", 0),
              _navItem("About", 1),
              _navItem("Projects", 2),
              _navItem("Experience", 3),
              _navItem("Contact", 4),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(key: homeKey, child: const HeroSectionTablet()),
            // Container(key: aboutKey, child: const AboutSectionTablet()),
            // Container(key: projectsKey, child: const ProjectsSectionTablet()),
            // Container(
            //   key: experienceKey,
            //   child: const ExperienceSectionTablet(),
            // ),
            // Container(key: contactKey, child: const ContactSectionTablet()),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, int index) {
    return TextButton(
      onPressed: () {
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
      child: Text(
        title,
        style: TextStyle(
          fontWeight: currentIndex == index
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}

class HeroSectionTablet extends StatelessWidget {
  const HeroSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
        ),
      ),
      child: Container(
        height: size.height * 0.65,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: const Color(0xFFF5EDE6), // your dawnPink
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            /// 🔹 LEFT CONTENT
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADLINE
                  Text(
                    "Hey There,\nI'm Sourav",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 42, // 👈 reduced from 64
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                      color: const Color(0xFF2F4F4F),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SUBTITLE
                  Text(
                    "Flutter Engineer • Building Scalable Apps",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// DESCRIPTION
                  SizedBox(
                    width: 420,
                    child: Text(
                      "I collaborate with startups and businesses to design, build, and ship high-performance Flutter applications.",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// CTA
                  // const HeroCTA(),
                ],
              ),
            ),

            /// 🔹 RIGHT IMAGE + GLOW
            Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Glow BG
                  Container(
                    height: 260,
                    width: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0XFFF3904F).withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  /// Image
                  Image.asset(
                    'assets/images/profile2.png',
                    height: size.height * 0.45,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
