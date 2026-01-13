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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: InkWell(
              onTap: () => launchUrl(Uri.parse(url)),
              child: Text(title),
            ),
          ),
          Container(child: Text(description)),
        ],
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extent makes thegrid more dinamic and responsive
      body: GridView.extent(
        maxCrossAxisExtent: 400,
        children: const [
          ProjectCard(
            title: "Chip-8",
            description: "chip-8 interpreter wrriten in C",
            url: "https://github.com/carlosvts/chip8",
          ),
          ProjectCard(
            title: "Bitmap parser",
            description:
                "Zero-dependency bitmap parser written in C++, convolution based image filter",
            url: "https://github.com/carlosvts/raw-image-processor",
          ),
          ProjectCard(
            title: "Malloc implementation"
            description: "Low-level memory management system that mimics all stdlib.h functions related to memory: malloc, calloc, realloc and free",
            url: "https://github.com/carlosvts/malloc-implementation",
          ),
          ProjectCard(
            title: "Input multiplexer",
            description: "Asynchronous input listener for mouse and keyboard developed in C++ using Linux epoll API",
            url: "https://github.com/carlosvts/input-multiplexer",
          ),
          ProjectCard(
            title: "HTTP Server",
            description: "A http-server that handles GET and POST methods written in pure C++ with linux syscalls",
            url: "https://github.com/carlosvts/http-server-cpp",
          ),
          ProjectCard(
            title: "Raytracer",
            description: "Basic implementation of a raycasting engine developed in C++ with SFML2",
            url: "https://github.com/carlosvts/raytracing",
          ),
          ProjectCard(
            title: "Sandbox Game",
            description: "A real-time physics/simulation engine developed in C++ with Raylib",
            url: "https://github.com/carlosvts/sandbox-game",
            )

        ],
      ),
    );
  }
}
