import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Project> projects = [
  Project(
    title: "Paper Trade",
    description:
        "(Currently in progress) Paper Trade is a scalable stock market simulation platform built with Flutter and FastAPI, designed to replicate real-world trading environments. It focuses on real-time data handling, portfolio tracking, and performance-driven architecture — enabling users to practice trading strategies in a risk-free ecosystem while ensuring system reliability and responsiveness.",
    image: [
      "assets/projects/pt1.png",
      "assets/projects/pt2.png",
      "assets/projects/pt3.png",
      "assets/projects/pt4.png",
      "assets/projects/pt5.png",
      "assets/projects/pt6.png",
    ],

    techStack: ["Flutter", "FastAPI", "GetX"],
    github: "https://github.com/Sourav0174/paper-trade-FE",
  ),
  Project(
    title: "Talksy",
    description:
        "Talksy is a real-time messaging application built with Flutter and Firebase, engineered for low-latency communication and seamless user experience. It demonstrates scalable chat architecture, real-time synchronization, and clean state management using Bloc.",
    image: [
      "assets/projects/talksy0.jpg",
      "assets/projects/talksy1.jpg",
      "assets/projects/talksy2.jpg",
      "assets/projects/talksy3.jpg",
    ],
    techStack: ["Flutter", "Firebase", "Bloc"],
    github: "https://github.com/Sourav0174/talksy_chat_app",
  ),
  Project(
    title: "Flexx",
    description:
        "Flexx is a social media platform integrating real-time features with AI-powered interactions. Built using Flutter and Firebase, it focuses on scalable architecture, dynamic UI systems, and intelligent user engagement through chatbot integration.",
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
    title: "Bella Bite",
    description:
        "LinkUp is a messaging UI system designed with advanced neumorphism and smooth interaction patterns. It showcases expertise in UI architecture, animation design, and building visually rich user interfaces in Flutter.",
    image: [
      "assets/projects/bellabites0.jpg",
      "assets/projects/bellabites1.jpg",
      "assets/projects/bellabites2.jpg",
      "assets/projects/bellabites3.jpg",
      "assets/projects/bellabites4.jpg",
      "assets/projects/bellabites5.jpg",
    ],
    techStack: ["Flutter", "UI Design"],
    github: "https://github.com/Sourav0174/LinkUp_message_app_UI/tree/master",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 60,
                ),
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
                      child: Text(
                        "FEATURED WORK",
                        style: theme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6366F1),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ).animate().fadeIn().slideX(begin: -0.2),

                    const SizedBox(height: 20),

                    Text(
                      "Selected Work",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: 600,
                      child: Text(
                        "A selection of production-focused applications built with scalability, performance, and real-world use cases in mind.",
                        style: theme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                    ).animate().fadeIn(delay: 400.ms),

                    const SizedBox(height: 40),
                    SizedBox(
                      width: 550,
                      height: 420, // 👈 FIXED HEIGHT (adjust as you want)
                      child: ScrollConfiguration(
                        behavior: const ScrollBehavior().copyWith(
                          scrollbars: false,
                        ),
                        child: Stack(
                          children: [
                            ListView.builder(
                              itemCount: projects.length,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                final p = projects[index];
                                final isActive = selected == index;

                                return GestureDetector(
                                  onTap: () => setState(() => selected = index),
                                  child: _buildProjectCard(p, isActive),
                                );
                              },
                            ),

                            /// 👇 FADE EFFECT
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: IgnorePointer(
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white.withValues(alpha: 0),
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// RIGHT SIDE (PREVIEW)
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
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
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectCard(Project p, bool isActive) {
    return AnimatedContainer(
      transform: Matrix4.identity()..scale(isActive ? 1.02 : 1.0),
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 20, right: 40),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        border: Border.all(
          color: isActive ? const Color(0xff6366F1) : Colors.grey.shade200,
          width: isActive ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isActive
                ? const Color(0xff6366F1).withOpacity(0.15)
                : Colors.black.withOpacity(0.05),
            blurRadius: isActive ? 30 : 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isActive)
            Positioned(
              left: 0,
              top: 16,
              bottom: 16,
              child: AnimatedContainer(
                constraints: const BoxConstraints(minHeight: 140),
                duration: const Duration(milliseconds: 300),
                width: isActive ? 4 : 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: isActive
                      ? const LinearGradient(
                          colors: [Color(0xff6366F1), Color(0xffA78BFA)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                  color: isActive ? null : Colors.grey.shade300,
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  style: theme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  p.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.bodyMedium!.copyWith(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: p.techStack.map((tech) {
                    return AnimatedScale(
                      scale: isActive ? 1.0 : 0.9,
                      duration: 200.ms,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xffEEF2FF), Color(0xffE0E7FF)],
                          ),
                        ),
                        child: Text(
                          tech,
                          style: theme.bodyMedium!.copyWith(fontSize: 12),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(p.github)),
                      child: Text(
                        "View Code",
                        style: theme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: Color(0xff6366F1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    isActive
                        ? Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Color(0xff6366F1),
                              )
                              .animate(onPlay: (c) => c.repeat())
                              .moveX(begin: 0, end: 6, duration: 900.ms)
                        : Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xff6366F1),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white.withOpacity(0.9)],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.images.length,
                itemBuilder: (_, i) {
                  return Image.asset(widget.images[i], fit: BoxFit.cover);
                },
              ),
            ),
          ),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(begin: -10, end: 10, duration: 4.seconds);
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
