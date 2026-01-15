import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';

class NotePage extends StatelessWidget {
  final String slug;

  const NotePage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Expanded(
            child: Center(
              child: Text(
                slug,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
