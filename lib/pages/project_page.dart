import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey);
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: const [
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
        ],
      ),
    );
  }
}
