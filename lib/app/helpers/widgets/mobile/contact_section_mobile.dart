import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/app/helpers/widgets/desktop/contact_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSectionMobile extends StatelessWidget {
  const ContactSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: AnimatedParticles(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 TITLE
              const Text(
                "Let’s Build Something Amazing 🚀",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Have a project, startup idea, or just want to collaborate? "
                "I'm always open to meaningful conversations.",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 30),

              /// 📩 CONTACT FORM
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.08),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: const ContactForm(),
              ),

              const SizedBox(height: 30),

              /// 🔗 SOCIAL LINKS
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 2,
                    color: const Color(0xFF8B5CF6),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "CONNECT WITH ME",
                    style: TextStyle(
                      color: Color(0xFF8B5CF6),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              Wrap(
                // spacing: 10, // horizontal spacing
                runSpacing: 10,
                children: [
                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/email.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "Email",
                    url: "mailto:info.sourav@gmail.com",
                    hoverColor: Colors.redAccent,
                  ),
                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/linkedin.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "LinkedIn",
                    url: "https://www.linkedin.com/in/sourav-791120257/",
                    hoverColor: const Color(0xFF0A66C2),
                  ),
                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/techIcons/github.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "GitHub",
                    url: "https://github.com/Sourav0174",
                    hoverColor: Colors.white,
                  ),

                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/leetcode.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "LeetCode",
                    url: "https://leetcode.com/u/sourav781/",
                    hoverColor: const Color.fromARGB(255, 255, 212, 94),
                  ),
                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/x.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "X",
                    url: "https://www.instagram.com/sourav17_official/",
                    hoverColor: const Color.fromARGB(255, 183, 183, 183),
                  ),
                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/instagram.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "Instagram",
                    url: "https://www.instagram.com/sourav17_official/",
                    hoverColor: const Color.fromARGB(255, 255, 139, 166),
                  ),

                  const SizedBox(width: 10),

                  _SocialIcon(
                    icon: Image.asset(
                      "assets/images/socialIcons/whatsapp.png",
                      width: 15,
                      height: 15,
                    ),
                    label: "WhatsApp",
                    url:
                        "https://wa.me/919041618674?text=Hi%20Sourav%2C%20I%20visited%20your%20portfolio!",
                    hoverColor: const Color(0xFF25D366), // WhatsApp green
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// 🧾 FOOTER
              const Divider(color: Colors.white24),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  "© 2026 Sourav — Built with Flutter",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final Widget icon;
  final String label;
  final String url;
  final Color hoverColor;

  const _SocialIcon({
    required this.icon,
    required this.label,
    required this.url,
    this.hoverColor = const Color(0xFF8B5CF6),
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool isHovering = false;

  Future<void> _launch() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch ${widget.url}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launch,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withOpacity(0.08),
            border: Border.all(
              color: isHovering
                  ? widget.hoverColor
                  : Colors.white.withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.hoverColor.withOpacity(isHovering ? 0.5 : 0.15),
                blurRadius: isHovering ? 30 : 12,
                offset: Offset(0, isHovering ? 12 : 6),
              ),
            ],
          ),
          transform: Matrix4.identity()
            ..translate(0.0, isHovering ? -6.0 : 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// ICON
              SizedBox(width: 22, height: 22, child: widget.icon),

              const SizedBox(width: 10),

              /// LABEL
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedParticles extends StatefulWidget {
  const AnimatedParticles({super.key});

  @override
  State<AnimatedParticles> createState() => _AnimatedParticlesState();
}

class _AnimatedParticlesState extends State<AnimatedParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> particles = [];
  final Random random = Random();

  final int particleCount = 50;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    _generateParticles();
  }

  void _generateParticles() {
    for (int i = 0; i < particleCount; i++) {
      particles.add(
        Particle(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: random.nextDouble() * 4 + 2,
          speed: random.nextDouble() * 0.002 + 0.0005,
          opacity: random.nextDouble() * 0.4 + 0.1,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(painter: ParticlePainter(particles));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SocialButtonMobile extends StatelessWidget {
  final String label;
  final String url;

  const SocialButtonMobile({super.key, required this.label, required this.url});

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.08),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
