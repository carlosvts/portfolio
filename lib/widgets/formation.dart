import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase());
  }
}

class FormationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const FormationItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title), SizedBox(height: 4), Text(subtitle)],
    );
  }
}

class FormationSection extends StatelessWidget {
  const FormationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitle(text: 'Formation'),

        SizedBox(height: 16),

        FormationItem(
          title: 'B.Sc. XXXXX (expected 202x)',
          subtitle: 'University XXX',
        ),

        SizedBox(height: 12),

        FormationItem(
          title: 'CS50x — Harvard University',
          subtitle: 'Foundations of computer science',
        ),

        SizedBox(height: 12),

        FormationItem(
          title: 'Self-directed studies',
          subtitle: 'Operating systems, memory management, graphics',
        ),
      ],
    );
  }
}
