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
        children: [
          GestureDetector(
            onTap: _openLink,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5EEAD4),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
