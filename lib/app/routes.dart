import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/pages/notes_page.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/about_page.dart';

final routes = {
  '/': (context) => const HomePage(),
  '/projects': (context) => const ProjectsPage(),
  '/about': (context) => const AboutPage(),
  '/notes': (context) => const NotesPage(),
};
