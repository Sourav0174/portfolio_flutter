import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT SIDE
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SECTION TITLE
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(144, 59, 67, 113),
                      Color(0xFF2F4F4F),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// SHORT BIO
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      color: Colors.black,
                    ),
                    children: const [
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
                      TextSpan(text: " digital products."),
                    ],
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                const SizedBox(height: 25),

                Text(
                  "I'm Sourav — a Flutter engineer focused on architecture, performance, "
                  "and building scalable systems.\n"
                  "I care about clean code, strong structure, and user experiences "
                  "that don't just work — but feel smooth.\n"
                  "Currently exploring AI systems and backend engineering "
                  "to build intelligent full-stack products.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    height: 1.9,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 50),

                Text(
                  "Tech & Tools",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 30),

                Wrap(
                  spacing: 20,
                  runSpacing: 20,
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
                      title: "PostgreSQL",
                      imagePath: "assets/techIcons/postgresql.png",
                      color: Color(0XFF47A248),
                    ),
                    TechBadge(
                      title: "MongoDB",
                      imagePath: "assets/techIcons/mongodb.png",
                      color: Color(0XFF47A248),
                    ),
                    TechBadge(
                      title: "Github",
                      imagePath: "assets/techIcons/github.png",
                      color: Colors.black12,
                    ),
                    TechBadge(
                      title: "Postman",
                      imagePath: "assets/techIcons/postman.png",
                      color: Colors.redAccent,
                    ),
                    TechBadge(
                      title: "Docker",
                      imagePath: "assets/techIcons/docker.png",
                      color: Color(0XFF02569B),
                    ),
                    TechBadge(
                      title: "ChatGPT",
                      imagePath: "assets/techIcons/chatgpt.png",
                      color: Colors.black12,
                    ),
                    TechBadge(
                      title: "Gemini",
                      imagePath: "assets/techIcons/gemini.png",
                      color: Color(0XFF02569B),
                    ),
                    TechBadge(
                      title: "Rozarpay",
                      imagePath: "assets/techIcons/rozarpay.png",
                      color: Colors.blue,
                    ),

                    TechBadge(
                      title: "Stripe",
                      imagePath: "assets/techIcons/stripe.png",
                      color: Color(0XFF02569B),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          /// RIGHT SIDE CREATIVE IMAGE
          Expanded(
            child: Center(
              child:
                  SizedBox(
                        height: 700,
                        width: 700,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// 🔥 GLOW BACKGROUND
                            Container(
                              height: 500,
                              width: 500,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    const Color(0XFFF3904F).withOpacity(0.35),
                                    const Color(0XFF3B4371).withOpacity(0.25),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.2, 0.6, 1],
                                ),
                              ),
                            ),

                            /// 🎨 ROTATED BACK CARD
                            Transform.rotate(
                              angle: -0.08,
                              child: Container(
                                height: 700,
                                width: 700,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0XFFF3904F),
                                      Color(0XFF3B4371),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0XFF3B4371,
                                      ).withOpacity(0.3),
                                      blurRadius: 40,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// 🧊 GLASS CARD WITH IMAGE
                            Container(
                              height: 700,
                              width: 700,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 30,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    /// IMAGE
                                    Positioned.fill(
                                      child: Image.asset(
                                        "assets/images/potrait.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    /// SOFT DARK GRADIENT OVERLAY
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center,
                                            colors: [
                                              Colors.black.withOpacity(0.4),
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    /// NAME TAG OVER IMAGE
                                    Positioned(
                                      bottom: 30,
                                      left: 25,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sourav Kumar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Flutter • AI Explorer",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(
                                                0.85,
                                              ),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .moveY(
                        begin: 0,
                        end: -12,
                        duration: 4.seconds,
                        curve: Curves.easeInOut,
                      ),
            ),
          ),

          /// RIGHT SIDE IMAGE
          // Expanded(
          //   child: Container(
          //     height: 700,
          //     width: 700,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       image: const DecorationImage(
          //         image: AssetImage("assets/images/potrait.jpg"),
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ArchitectureStack extends StatelessWidget {
  const ArchitectureStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: const [
          StackLayer(
            title: "AI & Intelligence",
            tech: "Exploring ML • AI Systems",
            color: Color(0XFF3B4371),
          ),
          SizedBox(height: 18),
          StackLayer(
            title: "Backend Systems",
            tech: "FastAPI • Node • REST • MongoDB",
            color: Color(0XFF4A4E8A),
          ),
          SizedBox(height: 18),
          StackLayer(
            title: "State Management",
            tech: "Bloc • Clean Architecture",
            color: Color(0XFF5E5FA3),
          ),
          SizedBox(height: 18),
          StackLayer(
            title: "UI Layer",
            tech: "Flutter • Dart • Animations",
            color: Color(0XFFF3904F),
          ),
        ],
      ),
    );
  }
}

class StackLayer extends StatelessWidget {
  final String title;
  final String tech;
  final Color color;

  const StackLayer({
    super.key,
    required this.title,
    required this.tech,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tech,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}

class TechBadge extends StatefulWidget {
  final String title;
  final String imagePath;
  final Color color;

  const TechBadge({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
  });

  @override
  State<TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<TechBadge> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(isHovering ? 0.35 : 0.15),
              blurRadius: isHovering ? 25 : 12,
              offset: Offset(0, isHovering ? 12 : 6),
            ),
          ],
          border: Border.all(color: widget.color.withOpacity(0.15)),
        ),
        transform: Matrix4.identity()..translate(0.0, isHovering ? -6.0 : 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ICON CIRCLE
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),

            const SizedBox(width: 6),

            /// TITLE
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9));
  }
}

class FloatingStat extends StatelessWidget {
  final String label;

  const FloatingStat({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ).animate().fadeIn().scale();
  }
}

class TechOrbit extends StatelessWidget {
  const TechOrbit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      width: 420,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Core Circle
          Container(
            height: 160,
            width: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
              ),
            ),
            child: const Center(
              child: Text(
                "Core",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// Floating Tech Labels
          const OrbitTech(title: "Flutter", top: 20, left: 140),
          const OrbitTech(title: "Bloc", bottom: 30, right: 120),
          const OrbitTech(title: "FastAPI", top: 100, right: 10),
          const OrbitTech(title: "Firebase", bottom: 60, left: 40),
          const OrbitTech(title: "MongoDB", top: 180, left: 10),
        ],
      ),
    );
  }
}

class OrbitTech extends StatelessWidget {
  final String title;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const OrbitTech({
    super.key,
    required this.title,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child:
          Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .moveY(begin: 0, end: -8, duration: 3.seconds),
    );
  }
}

class TechCategory extends StatelessWidget {
  final String title;
  final List<String> techs;

  const TechCategory({super.key, required this.title, required this.techs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: techs
              .map(
                (tech) =>
                    Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),
              )
              .toList(),
        ),
      ],
    );
  }
}
