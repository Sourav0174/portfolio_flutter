import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';

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
        padding: const EdgeInsets.all(60),
        // main container
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
                      /// 🌈 BACKGROUND GLOW
                      // Positioned(
                      //   bottom: -180,
                      //   left: size.width * 0.3,
                      //   child: Container(
                      //     height: 520,
                      //     width: 520,
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       gradient: RadialGradient(
                      //         colors: [
                      //           Colors.redAccent.withOpacity(0.25),
                      //           Colors.transparent,
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      /// 🔹 STATIC HEADLINE
                      Positioned(
                        top: 80,
                        left: 0,
                        child: RichText(
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
                                      color: Color.fromARGB(88, 59, 67, 113),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                              ),
                              const TextSpan(text: "\n\n"),
                              TextSpan(
                                text:
                                    "Flutter Developer • Freelancer • UI Enthusiast",
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
                        ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.3, end: 0),
                      ),

                      Positioned(
                        top: 80,
                        right: -20,
                        width: 360,
                        child:
                            Text(
                                  "Turning Ideas\nInto Scalable Apps",
                                  style: theme.bodyMedium!.copyWith(
                                    fontSize: 54,
                                    fontWeight: FontWeight.w900,
                                    height: 1.15,
                                    letterSpacing: -0.8,
                                    color: const Color(0xFF2F4F4F),
                                    shadows: const [
                                      Shadow(
                                        color: Color.fromARGB(88, 59, 67, 113),
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

                      /// 🔹 RIGHT DESCRIPTION
                      Positioned(
                        left: 0,
                        bottom: 60,
                        top: 420,
                        // right: 0,
                        width: 360,
                        child: Text(
                          "I help startups and businesses design and build fast, scalable, and production-ready Flutter apps — from idea to launch.",
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
                        ).animate(delay: 300.ms).fadeIn().slideX(begin: 0.2, end: 0),
                      ),

                      /// 🔹 CTA BADGE
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
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(
                                          0XFFF3904F,
                                        ).withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      ),
                                      // BoxShadow(
                                      //   color: Color(
                                      //     0XFF3B4371,
                                      //   ).withOpacity(0.5),
                                      //   blurRadius: 10,
                                      //   spreadRadius: 1,
                                      // ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0XFFF3904F),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(
                                                0XFFF3904F,
                                              ).withOpacity(0.6),
                                              blurRadius: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        "Available for work!",
                                        style: theme.bodyMedium!.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0XFFF3904F),
                                          shadows: [
                                            Shadow(
                                              color: Color(
                                                0XFFF3904F,
                                              ).withOpacity(0.35),
                                              blurRadius: 12,
                                            ),
                                          ],
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
                                shadows: const [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 14,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "DSA Problems Solved",
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

                      /// 🔹 TRUST BADGE
                      // Positioned(
                      //   right: 0,
                      //   bottom: 60,
                      //   child: Column(
                      //     children: [
                      //       const Icon(
                      //         Icons.verified,
                      //         size: 48,
                      //         color: Colors.black87,
                      //       ),
                      //       const SizedBox(height: 10),
                      //       Text(
                      //         "Production-Ready\nFlutter Apps",
                      //         textAlign: TextAlign.center,
                      //         style: theme.bodyMedium!.copyWith(
                      //           fontSize: 15,
                      //           height: 1.5,
                      //           color: Colors.black54,
                      //         ),
                      //       ),
                      //     ],
                      //   ).animate(delay: 700.ms).fadeIn(),
                      // ),

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
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .moveY(
                    begin: 0,
                    end: -10, // subtle float
                    duration: 4.seconds,
                    curve: Curves.easeInOut,
                  ),
        ),
      ),
    );
  }
}
