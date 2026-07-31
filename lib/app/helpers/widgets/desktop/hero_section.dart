import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final isDesktop = width > 1200;
    final isTablet = width > 800 && width <= 1200;

    double headingSize = isDesktop
        ? 64
        : isTablet
        ? 48
        : 34;

    double subHeadingSize = isDesktop
        ? 18
        : isTablet
        ? 16
        : 14;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFF3904F), Color(0XFF3B4371)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 20 : 24,
              vertical: 40,
            ),
            child: Container(
              padding: EdgeInsets.all(isDesktop ? 40 : 20),
              decoration: BoxDecoration(
                color: AppColors.dawnPink,
                borderRadius: BorderRadius.circular(28),
              ),

              /// 🔥 MAIN LAYOUT
              child: isDesktop
                  ? _buildDesktop(context, headingSize, subHeadingSize)
                  : _buildMobileTablet(context, headingSize, subHeadingSize),
            ),
          ),
        ),
      ),
    );
  }

  /// 💻 DESKTOP
  Widget _buildDesktop(BuildContext context, double h, double sh) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// LEFT CONTENT
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _heading(context, h),
              const SizedBox(height: 20),
              _subHeading(context, sh),
              const SizedBox(height: 30),
              const HeroCTA(),
              const SizedBox(height: 40),
              _experience(context),
            ],
          ).animate().fadeIn().slideX(begin: -0.1),
        ),

        const SizedBox(width: 40),

        /// RIGHT IMAGE
        Expanded(flex: 5, child: _imageSection()),
      ],
    );
  }

  /// 📱 MOBILE + TABLET
  Widget _buildMobileTablet(BuildContext context, double h, double sh) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _heading(context, h),
        const SizedBox(height: 16),
        _subHeading(context, sh),
        const SizedBox(height: 20),
        _imageSection(),
        const SizedBox(height: 20),
        const HeroCTA(),
        const SizedBox(height: 30),
        _experience(context),
      ],
    ).animate().fadeIn();
  }

  /// 🔤 HEADING
  Widget _heading(BuildContext context, double size) {
    return Text(
      "Hey There,\nI'm Sourav",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: size,
        fontWeight: FontWeight.w900,
        height: 1.2,
        color: const Color(0xFF2F4F4F),
      ),
    );
  }

  /// ✏️ SUB HEADING
  Widget _subHeading(BuildContext context, double size) {
    return Text(
      "Flutter Engineer • Building Scalable Mobile & Web Applications",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: size,
        color: Colors.black54,
        height: 1.6,
      ),
    );
  }

  /// 🖼 IMAGE SECTION
  Widget _imageSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/gradientPaint_2.png',
          height: 300,
        ).animate().fadeIn(),

        Image.asset(
          'assets/images/profile2.png',
          height: 420,
        ).animate().slideY(begin: 0.2).fadeIn(),
      ],
    );
  }

  /// 📊 EXPERIENCE
  Widget _experience(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "100+",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "DSA Problems • Strong Problem-Solving",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: 14, color: Colors.black54),
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
      "https://drive.google.com/uc?export=download&id=1m8bU3C1nklchsk5rED5YkTftOnNXREjn";

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
