import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  void _openLink() {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF15151A),
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Safeguard column to dont overflow container
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _openLink,
            child: SizedBox(
              // Titles respects width
              width: double.infinity,
              child: Text(
                "↗ $title",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF5EEAD4),
                ),
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            // Description repsects width
            width: double.infinity,
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
                height: 1.4,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
