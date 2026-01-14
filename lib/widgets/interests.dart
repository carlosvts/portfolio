import 'package:flutter/material.dart';
import 'package:portfolio/widgets/formation.dart';

class InterestItem extends StatelessWidget {
  final String text;
  const InterestItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 4),
      child: Text(text, textAlign: TextAlign.left),
    );
  }
}

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitle(text: "Interests"),

        SizedBox(height: 16),

        InterestItem(text: '• low level language'),
        InterestItem(text: '• operating systems'),
        InterestItem(text: '• memory management'),
        InterestItem(text: '• graphics programming'),
        InterestItem(text: '• language runtimes'),
        InterestItem(text: '• performance analysis'),
      ],
    );
  }
}
