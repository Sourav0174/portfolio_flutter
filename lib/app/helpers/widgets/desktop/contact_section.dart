import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatelessWidget {
  final Function(int)? onMenuTap;

  const ContactSection({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          /// Floating Particles
          const Positioned.fill(child: AnimatedParticles()),

          /// Your original Contact UI
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// LEFT SIDE – BIG MESSAGE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let’s Build Something\nAmazing Together.",
                          style: theme.bodyMedium!.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Text(
                          "Have a project in mind, a startup idea, "
                          "or just want to collaborate? "
                          "I’m always open to meaningful conversations.",
                          style: theme.bodyMedium!.copyWith(
                            fontSize: 18,
                            height: 1.8,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),

                        const SizedBox(height: 50),
                        const SizedBox(height: 40),

                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 2,
                              color: const Color(0xFF8B5CF6),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "CONNECT WITH ME",
                              style: theme.bodyMedium!.copyWith(
                                color: Color(0xFF8B5CF6),
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "Prefer social? Reach out through any platform below.",

                          style: theme.bodyMedium!.copyWith(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.white.withOpacity(0.65),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Wrap(
                          // spacing: 25, // horizontal spacing
                          runSpacing: 20,
                          children: [
                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/email.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "Email",
                              url: "mailto:info.sourav@gmail.com",
                              hoverColor: Colors.redAccent,
                            ),
                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/linkedin.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "LinkedIn",
                              url:
                                  "https://www.linkedin.com/in/sourav-791120257/",
                              hoverColor: const Color(0xFF0A66C2),
                            ),
                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/techIcons/github.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "GitHub",
                              url: "https://github.com/Sourav0174",
                              hoverColor: Colors.white,
                            ),

                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/leetcode.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "LeetCode",
                              url: "https://leetcode.com/u/sourav781/",
                              hoverColor: const Color.fromARGB(
                                255,
                                255,
                                212,
                                94,
                              ),
                            ),
                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/x.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "X",
                              url:
                                  "https://www.instagram.com/sourav17_official/",
                              hoverColor: const Color.fromARGB(
                                255,
                                183,
                                183,
                                183,
                              ),
                            ),
                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/instagram.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "Instagram",
                              url:
                                  "https://www.instagram.com/sourav17_official/",
                              hoverColor: const Color.fromARGB(
                                255,
                                255,
                                139,
                                166,
                              ),
                            ),

                            const SizedBox(width: 20),

                            _SocialIcon(
                              icon: Image.asset(
                                "assets/images/socialIcons/whatsapp.png",
                                width: 24,
                                height: 24,
                              ),
                              label: "WhatsApp",
                              url:
                                  "https://wa.me/919041618674?text=Hi%20Sourav%2C%20I%20visited%20your%20portfolio!",
                              hoverColor: const Color(
                                0xFF25D366,
                              ), // WhatsApp green
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 90),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // 🔥 clip EVERYTHING
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          /// Gradient Blob (behind)
                          Positioned(
                            right: -40,
                            top: 40,
                            child: const _GradientBlob(),
                          ),

                          /// Glass Card
                          Container(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 40,
                                  spreadRadius: -10,
                                  offset: const Offset(0, 30),
                                ),
                              ],
                            ),
                            child: Column(children: [ContactForm()]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),

              /// FOOTER
              _PortfolioFooter(onMenuTap: onMenuTap),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactField("Your Name", controller: nameController),
        const SizedBox(height: 20),

        _ContactField("Your Email", controller: emailController),
        const SizedBox(height: 20),

        _ContactField(
          "Your Message",
          controller: messageController,
          maxLines: 5,
        ),

        const SizedBox(height: 35),

        _GlowButton(
          nameController: nameController,
          emailController: emailController,
          messageController: messageController,
        ),
      ],
    );
  }
}

class _PortfolioFooter extends StatelessWidget {
  final Function(int)? onMenuTap;

  const _PortfolioFooter({this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Divider
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white.withOpacity(0.08),
        ),

        const SizedBox(height: 40),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT BRAND
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sourav",
                    style: theme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Building scalable mobile and AI-powered "
                    "applications using Flutter, FastAPI, and "
                    "modern cloud technologies.",
                    style: theme.bodyMedium!.copyWith(
                      color: Colors.white.withOpacity(0.6),
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 60),

            /// NAVIGATION
            Expanded(
              child: _FooterColumn(
                title: "Navigation",

                children: [
                  _FooterLink("Home", index: 0, onTap: onMenuTap),
                  _FooterLink("About", index: 1, onTap: onMenuTap),
                  _FooterLink("Projects", index: 2, onTap: onMenuTap),
                  _FooterLink("Experience", index: 3, onTap: onMenuTap),
                  _FooterLink("Contact", index: 4, onTap: onMenuTap),
                ],
              ),
            ),

            /// PROJECTS
            Expanded(
              child: _FooterColumn(
                title: "Projects",
                children: const [
                  _FooterLink("RiseAbove"),
                  _FooterLink("Flexx"),
                  _FooterLink("LinkUp"),
                ],
              ),
            ),

            /// LEGAL
            Expanded(
              child: _FooterColumn(
                title: "Projects",
                children: const [
                  _FooterLink(
                    "Talksy",
                    url: "https://github.com/Sourav0174/talksy_chat_app",
                  ),
                  _FooterLink(
                    "RiseAbove",
                    url: "https://github.com/Sourav0174/riseabove_frontend",
                  ),
                  _FooterLink(
                    "Flexx",
                    url: "https://github.com/Sourav0174/flexx_app/tree/master",
                  ),
                  _FooterLink(
                    "LinkUp",
                    url: "https://github.com/Sourav0174/LinkUp_message_app_UI",
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        /// Bottom text
        Text(
          "© 2026 Sourav — Built with Flutter",
          style: theme.bodyMedium!.copyWith(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 15),

        ...children.map(
          (e) => Padding(padding: const EdgeInsets.only(bottom: 8), child: e),
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final String? route;
  final int? index;
  final Function(int)? onTap;
  final String? url;

  const _FooterLink(this.text, {this.route, this.index, this.onTap, this.url});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: () async {
          if (widget.index != null && widget.onTap != null) {
            widget.onTap!(widget.index!); // scroll
          } else if (widget.route != null) {
            Get.toNamed(widget.route!); // internal route
          } else if (widget.url != null) {
            final uri = Uri.parse(widget.url!);
            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
              debugPrint("Could not launch ${widget.url}");
            }
          }
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: theme.bodyMedium!.copyWith(
            color: hover
                ? const Color(0xFF8B5CF6)
                : Colors.white.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          child: Text(widget.text),
        ),
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
                style: theme.bodyMedium!.copyWith(
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

class _GlowButton extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const _GlowButton({
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  State<_GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<_GlowButton>
    with TickerProviderStateMixin {
  ButtonState _state = ButtonState.idle;
  bool _isHovering = false;

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_state != ButtonState.idle) return;

    final name = widget.nameController.text.trim();
    final email = widget.emailController.text.trim();
    final message = widget.messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() => _state = ButtonState.loading);

    try {
      final response = await http.post(
        Uri.parse(
          "https://api.hsforms.com/submissions/v3/integration/submit/245442355/f2d117b6-0415-4fd7-9d53-6b48a142faeb",
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fields": [
            {"name": "firstname", "value": name},
            {"name": "email", "value": email},
            {"name": "message", "value": message},
          ],
        }),
      );

      if (response.statusCode == 200) {
        setState(() => _state = ButtonState.success);

        _confettiController.play();

        widget.nameController.clear();
        widget.emailController.clear();
        widget.messageController.clear();

        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() => _state = ButtonState.idle);
          }
        });
      } else {
        setState(() => _state = ButtonState.idle);
      }
    } catch (e) {
      setState(() => _state = ButtonState.idle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: _handleSubmit,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: double.infinity,
          height: 60,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovering ? -4.0 : 0.0)
            ..scale(_isHovering ? 1.02 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: _state == ButtonState.success
                ? const LinearGradient(
                    colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
                  )
                : const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  ),
            boxShadow: [
              BoxShadow(
                color:
                    (_state == ButtonState.success
                            ? const Color(0xFF22C55E)
                            : const Color(0xFF8B5CF6))
                        .withOpacity(_isHovering ? 0.9 : 0.6),
                blurRadius: _isHovering ? 40 : 30,
                spreadRadius: _isHovering ? 6 : 3,
                offset: Offset(0, _isHovering ? 16 : 10),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(child: _buildChild()),

              ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                emissionFrequency: 0.05,
                numberOfParticles: 25,
                gravity: 0.2,
                maxBlastForce: 20,
                minBlastForce: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChild() {
    switch (_state) {
      case ButtonState.idle:
        return Text(
          "Send Message",
          key: ValueKey("text"),
          style: theme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        );

      case ButtonState.loading:
        return const SizedBox(
          key: ValueKey("loader"),
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );

      case ButtonState.success:
        return const _AnimatedCheckmark(key: ValueKey("check"));
    }
  }
}

class _AnimatedCheckmark extends StatefulWidget {
  const _AnimatedCheckmark({super.key});

  @override
  State<_AnimatedCheckmark> createState() => _AnimatedCheckmarkState();
}

class _AnimatedCheckmarkState extends State<_AnimatedCheckmark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 26,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(painter: CheckPainter(_animation.value));
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

class CheckPainter extends CustomPainter {
  final double progress;

  CheckPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(size.width * 0.2, size.height * 0.55);
    path.lineTo(size.width * 0.45, size.height * 0.75);
    path.lineTo(size.width * 0.8, size.height * 0.3);

    final metric = path.computeMetrics().first;
    final extractPath = metric.extractPath(0, metric.length * progress);

    canvas.drawPath(extractPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum ButtonState { idle, loading, success }

class _GradientBlob extends StatefulWidget {
  const _GradientBlob();

  @override
  State<_GradientBlob> createState() => _GradientBlobState();
}

class _GradientBlobState extends State<_GradientBlob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _float;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat(reverse: true);

    _float = Tween<double>(
      begin: -15,
      end: 15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_float.value, _float.value * 0.5),
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF8B5CF6).withOpacity(0.25),
                    const Color(0xFF6366F1).withOpacity(0.15),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 160, sigmaY: 160),
                child: Container(color: Colors.transparent),
              ),
            ),
          );
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

class _ContactField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController controller;

  const _ContactField(this.hint, {required this.controller, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: theme.bodyMedium!.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.bodyMedium!.copyWith(
          color: Colors.white.withOpacity(0.5),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
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

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      // Depth effect (smaller = further)
      final depthFactor = particle.size / 6;

      final dx = particle.x * size.width;
      final dy = particle.y * size.height;

      final paint = Paint()
        ..shader =
            RadialGradient(
              colors: [
                const Color(0xFF8B5CF6).withValues(alpha: particle.opacity),
                const Color(
                  0xFF6366F1,
                ).withValues(alpha: particle.opacity * 0.6),
                Colors.transparent,
              ],
            ).createShader(
              Rect.fromCircle(
                center: Offset(dx, dy),
                radius: particle.size * 2,
              ),
            );

      canvas.drawCircle(Offset(dx, dy), particle.size * 4, paint);

      // Upward movement
      particle.y -= particle.speed;

      // Slight horizontal drift
      particle.x += sin(particle.y * 10) * 0.0005 * depthFactor;

      // Reset if out of screen
      if (particle.y < -0.05) {
        particle.y = 1.1;
        particle.x = Random().nextDouble();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  double x;
  double y;
  double size;
  double speed;
  double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}
