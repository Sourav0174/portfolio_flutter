import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app/helpers/widgets/desktop/project_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSectionMobile extends StatelessWidget {
  const ProjectsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Featured Work",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.2,
                color: Color(0xff6366F1),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Apps I've Built",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          /// 🚀 HORIZONTAL PROJECT CARDS
          SizedBox(
            height: 420,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];

                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  child: ProjectCardMobile(project: project),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCardMobile extends StatelessWidget {
  final Project project;

  const ProjectCardMobile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 📱 IMAGE PREVIEW
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                itemCount: project.image.length,
                itemBuilder: (_, i) {
                  return Image.asset(project.image[i], fit: BoxFit.cover);
                },
              ),
            ),
          ),

          /// 📝 CONTENT
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                /// DESCRIPTION
                Text(
                  project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 10),

                /// TECH STACK
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.techStack.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEF2FF),
                      ),
                      child: Text(tech, style: const TextStyle(fontSize: 11)),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 14),

                /// CTA
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(project.github)),
                      child: const Text(
                        "View Code",
                        style: TextStyle(
                          color: Color(0xff6366F1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Color(0xff6366F1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95));
  }
}
