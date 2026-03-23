import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';
import 'package:portfolio/app/helpers/constants/constant_variables.dart';

class Navbar extends StatelessWidget {
  final Function(int) onMenuTap;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.onMenuTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      elevation: 10, // 👈 controls height of shadow
      shadowColor: Colors.grey.withValues(alpha: 0.10), // 👈 shadow color
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 160, // adjust based on longest text
              child: AnimatedGreeting(),
            ),

            // CENTER - Menu (hide on mobile)
            if (width > 900)
              _DesktopMenu(onMenuTap: onMenuTap, currentIndex: currentIndex),

            // RIGHT - Contact / Menu icon
            width > 900 ? _ContactButton() : _MobileMenuButton(),
          ],
        ),
      ),
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  final Function(int) onMenuTap;
  final int currentIndex;

  _DesktopMenu({required this.onMenuTap, required this.currentIndex});
  int selectedIndex = 0;

  final List<String> items = const [
    "Home",
    "About",
    "Projects",
    "Experience",
    "Contact",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length, (index) {
        final isSelected = currentIndex == index;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              onMenuTap(index); // 🚀 scroll happens here
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInCirc,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.dawnPink.withOpacity(0.6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? AppColors.greyText : Colors.transparent,
                  width: 1.3,
                ),
              ),
              child: Text(
                items[index].toUpperCase(),
                style: theme.bodyMedium!.copyWith(fontSize: 15),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ContactButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("+91 9041618674", style: theme.bodyMedium!.copyWith(fontSize: 14)),
        const SizedBox(width: 8),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                offset: Offset(1, 3),
                color: Color.fromARGB(78, 158, 158, 158),
              ),
            ],
          ),
          child: ClipOval(
            child: SizedBox(
              child: Image.asset(
                'assets/gifs/phone.gif',
                fit: BoxFit.cover,
                color: AppColors.redDamask,
                colorBlendMode: BlendMode.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}

class AnimatedGreeting extends StatefulWidget {
  const AnimatedGreeting({super.key});

  @override
  State<AnimatedGreeting> createState() => _AnimatedGreetingState();
}

class _AnimatedGreetingState extends State<AnimatedGreeting>
    with SingleTickerProviderStateMixin {
  final List<String> greetings = [
    "Hello 👋",
    "नमस्ते 🙏",
    "Hola ✌️",
    "Bonjour 🫰",
  ];

  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );

    _controller.forward();

    Timer.periodic(const Duration(seconds: 6), (timer) {
      _controller.reverse().then((_) {
        setState(() {
          currentIndex = (currentIndex + 1) % greetings.length;
        });
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(
          greetings[currentIndex],
          style: theme.bodyMedium!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
