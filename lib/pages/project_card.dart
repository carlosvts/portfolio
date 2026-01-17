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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the card is in a wide layout (e.g., mobile single column)
        // This should fix mobile issues
        bool isWide = constraints.maxWidth > 350;

        return Container(
          padding: EdgeInsets.all(isWide ? 24 : 16),
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
                  "↗ $title",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF5EEAD4),
                    fontSize: isWide ? 20 : 16,
                  ),
                ),
              ),
              SizedBox(height: isWide ? 24 : 16),

              // Expanded ensures the scrollable area takes the remaining height of the card
              Expanded(
                child: Scrollbar(
                  // Adds a visual scrollbar for better UX on desktop/web
                  thumbVisibility: false,
                  child: SingleChildScrollView(
                    // Allows the description to be scrollable if it exceeds the card's height
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                        height: 1.4,
                        fontSize: isWide ? 14 : 12,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
