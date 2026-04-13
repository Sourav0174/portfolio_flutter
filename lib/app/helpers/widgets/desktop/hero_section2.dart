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

    return Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
