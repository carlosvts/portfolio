import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: GridView.extent(
          maxCrossAxisExtent: 400,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          children: const [
            ProjectCard(
              title: "Chip-8",
              description: "chip-8 interpreter written in C",
              url: "https://github.com/carlosvts/chip8",
            ),
            ProjectCard(
              title: "Bitmap parser",
              description:
                  "Zero-dependency bitmap parser written in C++, convolution based image filter",
              url: "https://github.com/carlosvts/raw-image-processor",
            ),
            ProjectCard(
              title: "Malloc implementation",
              description:
                  "Low-level memory management system mimicking malloc, calloc, realloc and free",
              url: "https://github.com/carlosvts/malloc-implementation",
            ),
            ProjectCard(
              title: "Input multiplexer",
              description:
                  "Asynchronous mouse and keyboard input listener using Linux epoll",
              url: "https://github.com/carlosvts/input-multiplexer",
            ),
            ProjectCard(
              title: "HTTP Server",
              description:
                  "HTTP server handling GET and POST using pure C++ and Linux syscalls",
              url: "https://github.com/carlosvts/http-server-cpp",
            ),
            ProjectCard(
              title: "Raytracer",
              description: "Basic raycasting engine written in C++ with SFML2",
              url: "https://github.com/carlosvts/raytracing",
            ),
            ProjectCard(
              title: "Sandbox Game",
              description:
                  "Real-time physics sandbox built with C++ and Raylib",
              url: "https://github.com/carlosvts/sandbox-game",
            ),
            ProjectCard(
              title: "Game of Life",
              description:
                  "Interactive Conway's Game of Life simulation using C++ and SFML2",
              url: "https://github.com/carlosvts/GameOfLife",
            ),
          ],
        ),
      ),
    );
  }
}
