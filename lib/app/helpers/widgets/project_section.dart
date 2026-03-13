import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Project> projects = [
  Project(
    title: "Flexx",
    description:
        "A social media platform with AI chatbot, modern UI, and real-time features built with Flutter and Firebase.",
    image: [
      "assets/projects/flexx1.jpg",
      "assets/projects/flexx2.jpg",
      "assets/projects/flexx3.jpg",
      "assets/projects/flexx4.jpg",
    ],
    techStack: ["Flutter", "Firebase", "Bloc"],
    github: "https://github.com/Sourav0174/flexx_app/tree/master",
  ),

  Project(
    title: "LinkUp",
    description:
        "Messenger UI application designed with rich neumorphism and smooth chat interactions.",
    image: ["assets/projects/linkup1.png"],
    techStack: ["Flutter", "UI Design"],
    github: "https://github.com/Sourav0174/LinkUp_message_app_UI/tree/master",
  ),
];

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final project = projects[selected];

    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.05,
            child: CustomPaint(painter: GridPainter()),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF2FF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "FEATURED WORK",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff6366F1),
                    letterSpacing: 1.2,
                  ),
                ),
              ).animate().fadeIn().slideX(begin: -0.2),

              const SizedBox(height: 20),

              Text(
                "Apps I've Designed & Built",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

              const SizedBox(height: 20),

              SizedBox(
                width: 600,
                child: Text(
                  "A selection of products I've designed and engineered — "
                  "from AI-powered mental health tools to social platforms "
                  "and modern chat interfaces.",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    height: 1.6,
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms),

              const SizedBox(height: 40),

              SizedBox(
                height: 520,
                child: Row(
                  children: [
                    /// LEFT SIDE (PROJECT LIST)
                    SizedBox(
                      width: 450,
                      child: Column(
                        children: List.generate(projects.length, (index) {
                          final p = projects[index];
                          final isActive = selected == index;

                          return GestureDetector(
                            onTap: () => setState(() => selected = index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.white,
                                border: Border.all(
                                  color: isActive
                                      ? const Color(0xff6366F1)
                                      : Colors.grey.shade200,
                                  width: isActive ? 2 : 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: isActive
                                        ? const Color(
                                            0xff6366F1,
                                          ).withOpacity(0.15)
                                        : Colors.black.withOpacity(0.05),
                                    blurRadius: isActive ? 35 : 15,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    p.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  const SizedBox(height: 12),
                                  Wrap(
                                    spacing: 8,
                                    children: p.techStack.map((tech) {
                                      return Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xffEEF2FF),
                                                  Color(0xffE0E7FF),
                                                ],
                                              ),
                                            ),
                                            child: Text(
                                              tech,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                          .animate()
                                          .fadeIn(delay: 200.ms)
                                          .slideY(begin: 0.3);
                                    }).toList(),
                                  ),

                                  const SizedBox(height: 16),

                                  Text(
                                    "View Code →",
                                    style: TextStyle(
                                      color: const Color(0xff6366F1),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const Spacer(),

                    /// RIGHT SIDE (PREVIEW)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          /// GRADIENT GLOW
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: 420,
                            height: 420,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xff6366F1).withOpacity(0.35),
                                  const Color(0xffA5B4FC).withOpacity(0.25),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 60,
                                  offset: const Offset(0, 30),
                                ),
                              ],
                            ),
                            child: _PhoneMockup(
                              // key: ValueKey(project.title),
                              images: project.image,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    const gridSize = 40;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FeaturedProjectCard extends StatefulWidget {
  final Project project;

  const FeaturedProjectCard({super.key, required this.project});

  @override
  State<FeaturedProjectCard> createState() => _FeaturedProjectCardState();
}

class _FeaturedProjectCardState extends State<FeaturedProjectCard> {
  bool hovering = false;

  void openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(hovering ? 0.15 : 0.06),
              blurRadius: hovering ? 40 : 20,
              offset: const Offset(0, 20),
            ),
          ],
        ),

        child: Row(
          children: [
            /// LEFT SIDE (TEXT)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: project.techStack.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF3F3F3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(tech),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => openLink(project.github),
                        icon: const Icon(Icons.code),
                        label: const Text("GitHub"),
                      ),

                      const SizedBox(width: 16),

                      if (project.playstore != null)
                        ElevatedButton.icon(
                          onPressed: () => openLink(project.playstore!),
                          icon: const Icon(Icons.play_arrow),
                          label: const Text("Play Store"),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 40),

            /// RIGHT SIDE (PHONE IMAGES)
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 420,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(project.image.length, (index) {
                    final img = project.image[index];

                    return AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      left: 80.0 * index,
                      top: hovering ? 20.0 * index : 40.0 * index,
                      child: Transform.rotate(
                        angle: hovering ? -0.05 * index : -0.02 * index,
                        child: _PhoneMockup(images: project.image),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneMockup extends StatefulWidget {
  final List<String> images;

  const _PhoneMockup({required this.images});

  @override
  State<_PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<_PhoneMockup>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), autoScroll);
    });
  }

  void autoScroll() async {
    while (mounted) {
      await controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(seconds: 6),
        curve: Curves.easeInOut,
      );

      await Future.delayed(const Duration(seconds: 1));

      await controller.animateTo(
        0,
        duration: const Duration(seconds: 6),
        curve: Curves.easeInOut,
      );

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 430,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 50,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ListView.builder(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.images.length,
          itemBuilder: (_, index) {
            return Image.asset(widget.images[index], fit: BoxFit.cover);
          },
        ),
      ),
    );
  }
}

class ProjectShowcase extends StatefulWidget {
  final Project project;
  final bool reverse;

  const ProjectShowcase({
    super.key,
    required this.project,
    required this.reverse,
  });

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  bool hovering = false;

  void openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    final textSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: 420,
          child: Text(
            project.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 24),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.techStack.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffF5F7FA), Color(0xffE4E7EB)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(tech),
            );
          }).toList(),
        ),

        const SizedBox(height: 30),

        ElevatedButton.icon(
          onPressed: () => openLink(project.github),
          icon: const Icon(Icons.code),
          label: const Text("GitHub"),
        ),
      ],
    );

    final phoneSection = MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: SizedBox(
        height: 420,
        width: 520,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// BACKGROUND GLOW
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: hovering ? 420 : 350,
              height: hovering ? 420 : 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xff6366F1).withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            /// PHONE STACK
            ...List.generate(project.image.length, (index) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                left: hovering ? 70.0 * index : 50.0 * index,
                top: hovering ? 10.0 * index : 30.0 * index,
                child: Transform.rotate(
                  angle: hovering ? -0.06 * index : -0.02 * index,
                  child: _PhoneMockup(images: [project.image[index]]),
                ),
              );
            }),
          ],
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.reverse
          ? [
              phoneSection
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .moveY(
                    begin: -6,
                    end: 6,
                    duration: const Duration(seconds: 4),
                  ),

              textSection.animate().slideX(begin: 0.2).fadeIn(duration: 600.ms),
            ]
          : [
              textSection
                  .animate()
                  .slideX(begin: -0.2)
                  .fadeIn(duration: 600.ms),

              phoneSection
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .moveY(
                    begin: -6,
                    end: 6,
                    duration: const Duration(seconds: 4),
                  ),
            ],
    );
  }
}

class Project {
  final String title;
  final String description;
  final List<String> image;
  final List<String> techStack;

  final String github;
  final String? playstore;
  final String? liveDemo;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    required this.techStack,
    required this.github,
    this.playstore,
    this.liveDemo,
  });
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  void openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              /// PROJECT IMAGE
              Positioned.fill(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: hovering ? 1.05 : 1,
                  child: Image.asset(project.image.first, fit: BoxFit.cover),
                ),
              ),

              /// GRADIENT OVERLAY
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.75),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              /// CONTENT
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// DESCRIPTION
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// TECH STACK
                    Wrap(
                      spacing: 8,
                      children: project.techStack
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.15),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 16),

                    /// BUTTONS
                    Row(
                      children: [
                        /// GITHUB
                        IconButton(
                          icon: const Icon(Icons.code, color: Colors.white),
                          onPressed: () => openLink(project.github),
                        ),

                        if (project.playstore != null)
                          IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () => openLink(project.playstore!),
                          ),

                        if (project.liveDemo != null)
                          IconButton(
                            icon: const Icon(
                              Icons.open_in_new,
                              color: Colors.white,
                            ),
                            onPressed: () => openLink(project.liveDemo!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
