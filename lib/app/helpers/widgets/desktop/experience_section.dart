import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  double progress = 0;
  int selectedIndex = 0;

  void updateProgress() {
    final scroll = Scrollable.of(context).position.pixels;

    setState(() {
      progress = (scroll / 800).clamp(0, 1);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Scrollable.of(context).position.addListener(updateProgress);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfff8fafc), Color(0xffffffff)],
        ),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 100),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionHeader(),
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _TimelineList(
                        experiences: experiences,
                        selectedIndex: selectedIndex,
                        progress: progress,
                        onSelect: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 80),

                    Expanded(
                      flex: 5,
                      child: _ExperienceDetails(
                        experience: experiences[selectedIndex],
                      ),
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

class StarField extends StatefulWidget {
  const StarField({super.key});

  @override
  State<StarField> createState() => _StarFieldState();
}

class _StarFieldState extends State<StarField>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          painter: StarPainter(controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class StarPainter extends CustomPainter {
  final double progress;

  StarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(.4);

    for (int i = 0; i < 120; i++) {
      final dx = (i * 37 % size.width);
      final dy = ((i * 91 + progress * 200) % size.height);

      canvas.drawCircle(Offset(dx, dy), 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    const gap = 40.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ExperienceDetails extends StatefulWidget {
  final Experience experience;

  const _ExperienceDetails({required this.experience});

  @override
  State<_ExperienceDetails> createState() => _ExperienceDetailsState();
}

class _ExperienceDetailsState extends State<_ExperienceDetails> {
  double x = 0;
  double y = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            x = (event.localPosition.dx - 200) / 20;
            y = (event.localPosition.dy - 150) / 20;
          });
        },
        onExit: (_) {
          setState(() {
            x = 0;
            y = 0;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..translate(x, y),
          key: ValueKey(widget.experience.year),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xff6366f1), Color(0xff8b5cf6)],
                ).createShader(bounds),
                child: Text(
                  widget.experience.role,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              /// Company
              Text(
                widget.experience.company,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),

              const SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Key Highlights",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const SizedBox(height: 14),

                  ...widget.experience.highlights.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineList extends StatelessWidget {
  final List<Experience> experiences;
  final int selectedIndex;
  final Function(int) onSelect;
  final double progress;

  const _TimelineList({
    required this.experiences,
    required this.selectedIndex,
    required this.onSelect,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 6,
          top: 10,
          bottom: 10,
          child: Container(width: 2, color: Colors.grey.withOpacity(0.2)),
        ),

        /// Animated progress line
        Positioned(
          left: 6,
          top: 10,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 2,
            height: 300 * progress,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primary.withOpacity(.4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        Column(
          children: List.generate(experiences.length, (index) {
            final exp = experiences[index];
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onSelect(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.only(bottom: 35),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isSelected
                      ? AppColors.primary.withOpacity(.08)
                      : Colors.transparent,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Dot
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return Container(
                          width: 14 + (value * 6),
                          height: 14 + (value * 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade400,
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(.5),
                                      blurRadius: 20,
                                      spreadRadius: 4,
                                    ),
                                  ]
                                : [],
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp.year,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 4),

                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 250),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.black
                                : Colors.grey.shade600,
                          ),
                          child: Text(exp.role),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class Experience {
  final String year;
  final String role;
  final String company;
  final List<String> tech;
  final List<String> highlights;
  final String description;

  Experience({
    required this.year,
    required this.role,
    required this.company,
    required this.tech,
    required this.highlights,
    required this.description,
  });
}

final List<Experience> experiences = [
  Experience(
    year: "Aug 2025 to Jan 2026",
    role: " Software Developer Intern",
    company: "Appknit",
    tech: ["Flutter", "GetX", "Firebase"],
    highlights: [
      "Built 3 production ready apps",
      "Implemented clean architecture",
      "Integrated Firebase authentication",
      "Developed scalable Bloc systems",
    ],
    description:
        "Focused on building real-world products including Flexx, LinkUp and RiseAbove.",
  ),
];

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xff6366f1), Color.fromARGB(255, 189, 118, 255)],
          ).createShader(bounds),
          child: const Text(
            "My Journey",
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
        ),

        const SizedBox(height: 14),

        const Text(
          "From learning programming fundamentals to building AI-powered mobile applications.",
          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.grey),
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            _StatItem("10+", "Projects Built"),
            const SizedBox(width: 40),
            _StatItem("3", "Production Apps"),
            const SizedBox(width: 40),
            _StatItem("AI + Mobile", "Focus Area"),
          ],
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}
