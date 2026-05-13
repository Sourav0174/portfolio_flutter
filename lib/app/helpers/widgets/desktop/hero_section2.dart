import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return size.width > 1500
        ? Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Container(
                height: size.height * 0.78,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: AppColors.dawnPink,
                  borderRadius: BorderRadius.circular(28),
                ),
                child:
                    Stack(
                          children: [
                            /// 🔹 CTA BUTTON
                            Positioned(
                                  right: 60,
                                  top: 620,
                                  child: const HeroCTA(),
                                )
                                .animate(delay: 700.ms)
                                .fadeIn()
                                .slideY(begin: 0.3, end: 0),

                            /// 🔹 LEFT TEXT
                            Positioned(
                              top: 80,
                              left: 0,
                              child:
                                  RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Hey There,\nI'm Sourav",
                                              style: theme.bodyMedium!.copyWith(
                                                fontSize: 64,
                                                fontWeight: FontWeight.w900,
                                                height: 1.15,
                                                letterSpacing: -0.8,
                                                color: const Color(0xFF2F4F4F),
                                                shadows: const [
                                                  Shadow(
                                                    color: Color.fromARGB(
                                                      88,
                                                      59,
                                                      67,
                                                      113,
                                                    ),
                                                    blurRadius: 10,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const TextSpan(text: "\n\n"),
                                            TextSpan(
                                              text:
                                                  "Flutter Engineer • Building Scalable Mobile & Web Applications",
                                              style: theme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54,
                                                letterSpacing: 0.6,
                                                shadows: const [
                                                  Shadow(
                                                    color: Colors.black12,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .animate()
                                      .fadeIn(duration: 700.ms)
                                      .slideY(begin: 0.3, end: 0),
                            ),

                            /// 🔹 RIGHT TITLE
                            Positioned(
                              top: 80,
                              right: -20,
                              width: 360,
                              child:
                                  Text(
                                        "Designing & Shipping\nHigh-Performance Apps",
                                        style: theme.bodyMedium!.copyWith(
                                          fontSize: 54,
                                          fontWeight: FontWeight.w900,
                                          height: 1.15,
                                          letterSpacing: -0.8,
                                          color: const Color(0xFF2F4F4F),
                                          shadows: const [
                                            Shadow(
                                              color: Color.fromARGB(
                                                88,
                                                59,
                                                67,
                                                113,
                                              ),
                                              blurRadius: 10,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                      )
                                      .animate(delay: 300.ms)
                                      .fadeIn()
                                      .slideX(begin: 0.2, end: 0),
                            ),

                            /// 🔹 DESCRIPTION
                            Positioned(
                              left: 0,
                              top: 420,
                              width: 360,
                              child:
                                  Text(
                                        "I collaborate with startups and businesses to design, build, and ship high-performance Flutter applications — focusing on clean architecture, scalability, and real-world impact.",
                                        style: theme.bodyMedium!.copyWith(
                                          fontSize: 17,
                                          height: 1.8,
                                          color: Colors.black54,
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black12,
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                      )
                                      .animate(delay: 300.ms)
                                      .fadeIn()
                                      .slideX(begin: 0.2, end: 0),
                            ),

                            /// 🔹 STATUS BADGE
                            Positioned(
                              right: 60,
                              top: 420,
                              child:
                                  Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 22,
                                          vertical: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            95,
                                            255,
                                            255,
                                            255,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(
                                                0XFFF3904F,
                                              ).withOpacity(0.5),
                                              blurRadius: 10,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0XFFF3904F),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color(
                                                      0XFFF3904F,
                                                    ).withOpacity(0.6),
                                                    blurRadius: 12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              "Open to Opportunities",
                                              style: theme.bodyMedium!.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0XFFF3904F),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .animate(delay: 500.ms)
                                      .fadeIn()
                                      .slideY(begin: 0.3, end: 0),
                            ),

                            /// 🔹 EXPERIENCE
                            Positioned(
                              left: 0,
                              bottom: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "100+",
                                    style: theme.bodyMedium!.copyWith(
                                      fontSize: 46,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "DSA Problems • Strong Problem-Solving",
                                    style: theme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      letterSpacing: 1.3,
                                      height: 1.6,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ).animate(delay: 600.ms).fadeIn(),
                            ),

                            /// 🔹 CENTER IMAGE
                            Positioned(
                              bottom: -30,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                          'assets/images/gradientPaint_2.png',
                                          height: size.height * 0.5,
                                          fit: BoxFit.contain,
                                        )
                                        .animate()
                                        .fadeIn(duration: 900.ms)
                                        .scale(
                                          begin: const Offset(0.9, 0.9),
                                          end: const Offset(1, 1),
                                        ),

                                    Image.asset(
                                          'assets/images/profile2.png',
                                          height: size.height * 0.78,
                                          fit: BoxFit.contain,
                                        )
                                        .animate(delay: 200.ms)
                                        .fadeIn(duration: 900.ms)
                                        .slideY(begin: 0.25, end: 0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .moveY(
                          begin: 0,
                          end: -10,
                          duration: 4.seconds,
                          curve: Curves.easeInOut,
                        ),
              ),
            ),
          )
        : Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1800),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: AppColors.dawnPink,
                  borderRadius: BorderRadius.circular(28),
                ),

                /// 🔥 MAIN RESPONSIVE LAYOUT
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 800;

                    return isMobile
                        ? Column(
                            children: [
                              _buildImage(size),
                              const SizedBox(height: 30),
                              _buildContent(context),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: _buildImage(size)),
                              const SizedBox(width: 40),
                              Expanded(flex: 1, child: _buildContent(context)),
                            ],
                          );
                  },
                ),
              ),
            ),
          );
  }

  /// 🔹 LEFT IMAGE
  Widget _buildImage(Size size) {
    return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/gradientPaint_2.png',
              height: size.height * 0.4,
            ),
            Image.asset(
              'assets/images/profile2.png',
              height: size.height * 0.6,
            ),
          ],
        )
        .animate()
        .fadeIn(duration: 800.ms)
        .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }

  /// 🔹 RIGHT CONTENT
  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// TITLE
        Text(
          "Hey There,\nI'm Sourav",
          style: theme.bodyMedium!.copyWith(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 1.2,
            color: const Color(0xFF2F4F4F),
          ),
        ).animate().fadeIn().slideY(begin: 0.2),

        const SizedBox(height: 16),

        /// SUBTITLE
        Text(
          "Flutter Engineer • Building Scalable Apps",
          style: theme.bodyMedium!.copyWith(
            fontSize: 18,
            color: Colors.black54,
          ),
        ).animate(delay: 200.ms).fadeIn(),

        const SizedBox(height: 20),

        /// DESCRIPTION
        Text(
          "I build high-performance Flutter apps with clean architecture, scalability, and real-world impact.",
          style: theme.bodyMedium!.copyWith(
            fontSize: 16,
            height: 1.6,
            color: Colors.black54,
          ),
        ).animate(delay: 300.ms).fadeIn(),

        const SizedBox(height: 30),

        /// CTA
        MediaQuery.of(context).size.width > 1200
            ? Row(
                children: [
                  const HeroCTA(),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Open to Opportunities",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFF3904F),
                      ),
                    ),
                  ).animate(delay: 400.ms).fadeIn(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeroCTA(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Open to Opportunities",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFF3904F),
                      ),
                    ),
                  ).animate(delay: 400.ms).fadeIn(),
                ],
              ),
      ],
    );
  }
}

class HeroCTA extends StatefulWidget {
  const HeroCTA({super.key});

  @override
  State<HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<HeroCTA> {
  bool isHoveringPrimary = false;
  bool isHoveringSecondary = false;
  bool isDownloading = false;

  final String resumeUrl =
      "https://drive.google.com/uc?export=download&id=12F86UPP2g-9bIonAbLKxrfLH5VJ3yksZ";

  Future<void> _downloadResume() async {
    setState(() => isDownloading = true);

    await Future.delayed(const Duration(milliseconds: 1200)); // fake loading

    final uri = Uri.parse(resumeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: "_blank");
    }

    setState(() => isDownloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 🔥 PRIMARY CTA (Download Resume)
        MouseRegion(
          onEnter: (_) => setState(() => isHoveringPrimary = true),
          onExit: (_) => setState(() => isHoveringPrimary = false),
          child: GestureDetector(
            onTap: _downloadResume,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [const Color(0XFFF3904F), const Color(0XFF3B4371)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0XFFF3904F,
                    ).withOpacity(isHoveringPrimary ? 0.6 : 0.3),
                    blurRadius: isHoveringPrimary ? 25 : 12,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// ✨ SHINE EFFECT
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 700),
                    left: isHoveringPrimary ? 200 : -150,
                    child: Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isDownloading ? Icons.hourglass_top : Icons.download,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          isDownloading ? "Downloading..." : "Download Resume",
                          key: ValueKey(isDownloading),
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
