import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NoteItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
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
