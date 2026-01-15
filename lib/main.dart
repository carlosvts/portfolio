import 'package:flutter/material.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/app/routes.dart';
import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/notes_page.dart';
import 'package:portfolio/widgets/notepage.dart';
import 'package:portfolio/theme/app_theme.dart';

void main() {
  runApp(App());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');

        // Home
        if (uri.path == '/') {
          return MaterialPageRoute(builder: (_) => const HomePage());
        }

        if (uri.path == '/about') {
          return MaterialPageRoute(builder: (_) => const AboutPage());
        }

        // Notes index
        if (uri.path == '/notes') {
          return MaterialPageRoute(builder: (_) => const NotesPage());
        }

        // Notes detail: /notes/:slug
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'notes') {
          final slug = uri.pathSegments[1];

          return MaterialPageRoute(builder: (_) => NotePage(slug: slug));
        }

        // Fallback
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('404'))),
        );
      },
    );
  }
}
