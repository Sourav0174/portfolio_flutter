import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/widgets/desktop/experience_section.dart';

class ExperienceSectionMobile extends StatelessWidget {
  const ExperienceSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xfff8fafc), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 HEADER
          const Text(
            "My Journey",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const Text(
            "From learning to building real-world scalable apps.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 30),

          /// 📊 STATS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatItemMobile("10+", "Projects"),
              _StatItemMobile("3", "Apps"),
              _StatItemMobile("AI", "Focus"),
            ],
          ),

          const SizedBox(height: 30),

          /// 🚀 EXPERIENCE LIST
          Column(
            children: List.generate(experiences.length, (index) {
              final exp = experiences[index];

              return ExperienceCardMobile(exp: exp, index: index);
            }),
          ),
        ],
      ),
    );
  }
}

class ExperienceCardMobile extends StatelessWidget {
  final Experience exp;
  final int index;

  const ExperienceCardMobile({
    super.key,
    required this.exp,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 📅 YEAR + ROLE
          Text(
            exp.year,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 6),

          Text(
            exp.role,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(exp.company, style: TextStyle(color: Colors.grey.shade600)),

          const SizedBox(height: 16),

          /// 🔥 HIGHLIGHTS
          Column(
            children: exp.highlights.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff6366F1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 200).ms).slideY(begin: 0.2);
  }
}

class _StatItemMobile extends StatelessWidget {
  final String value;
  final String label;

  const _StatItemMobile(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
