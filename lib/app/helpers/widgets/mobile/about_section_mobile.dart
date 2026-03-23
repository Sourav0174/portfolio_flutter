import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSectionMobile extends StatelessWidget {
  const AboutSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TITLE (CLEAN)
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color.fromARGB(144, 59, 67, 113), Color(0xFF2F4F4F)],
            ).createShader(bounds),
            child: const Text(
              "About Me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
          ),

          // const Text(
          //   "About Me",
          //   style: TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w700,
          //     letterSpacing: -0.5,
          //   ),
          // ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 16),

          /// 💡 HEADLINE (STRONG TYPOGRAPHY)
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
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

          // Text(
          //   "I build fast, scalable\nand intelligent apps.",
          //   style: TextStyle(
          //     fontSize: 28,
          //     fontWeight: FontWeight.w800,
          //     height: 1.2,
          //     color: Color(0xFF111111), // 🔥 important
          //   ),
          // ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),
          const SizedBox(height: 12),

          /// 🧠 DESCRIPTION
          const Text(
            "I'm Sourav — a Flutter developer focused on performance, clean architecture and scalable systems.\n"
            "I create apps that feel smooth, fast and premium.\n"
            "Currently exploring AI + backend to build intelligent products.",
            style: TextStyle(fontSize: 15, height: 1.7, color: Colors.black87),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 40),

          /// 🖼️ IMAGE + INFO CARD (NEW STYLE)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    /// IMAGE
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/images/potrait.jpg",
                        height: 600,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// INFO
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          /// NAME + ROLE
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sourav Kumar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Flutter Developer • AI Explorer",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// STATUS DOT
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.25),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),

          const SizedBox(height: 30),

          /// 🛠️ TECH TITLE
          const Text(
            "Tech & Tools",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 16),

          /// 🧩 CLEAN TECH GRID
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
    );
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                height: 30,
                fit: BoxFit.fill,
              ),
            ),

            const SizedBox(width: 6),

            /// TITLE
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9));
  }
}
