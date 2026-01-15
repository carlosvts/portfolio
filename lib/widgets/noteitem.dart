import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final String slug;

  const NoteItem({super.key, required this.title, required this.slug});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => {Navigator.pushNamed(context, "/notes/$slug")},
        child: Text(
          "> $title",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0XFF5EEAD4),
          ),
        ),
      ),
    );
  }
}
