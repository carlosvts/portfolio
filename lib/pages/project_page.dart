import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/pages/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsetsGeometry.directional(top: 30)),
          // 1. Navbar stays fixed at the top
          const Navbar(),

          Expanded(
            // 2. Expanded tells the grid to take the remaining vertical space
            child: Padding(
              padding: const EdgeInsets.all(32),
              // Use shrinkWrap: false (default) inside Expanded
              child: GridView.extent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                children: const [
                  ProjectCard(
                    title: "Chip-8",
                    description:
                        "Chip-8 virtual machine interpreter with complete Fetch-Decode-Execute cycle. ROM emulator\n\n\nC • CHIP8 • emulation • SDL2",
                    url: "https://github.com/carlosvts/chip8",
                  ),
                  ProjectCard(
                    title: "Bitmap parser",
                    description:
                        "Zero-dependency bitmap parser written in C++, convolution based image filter\n\nC++ • parsing • image processing • image filtering",
                    url: "https://github.com/carlosvts/raw-image-processor",
                  ),
                  ProjectCard(
                    title: "Malloc implementation",
                    description:
                        "Low-level memory management system mimicking malloc, calloc, realloc and free in a doubly linked list\n\n\nC • memory • heap • syscalls • cpu architecture",
                    url: "https://github.com/carlosvts/malloc-implementation",
                  ),
                  ProjectCard(
                    title: "Input multiplexer",
                    description:
                        "Asynchronous mouse and keyboard input listener fetching raw hexadecimal data using Linux epoll\n\n\nC++ • Linux • epoll • concurrency",
                    url: "https://github.com/carlosvts/input-multiplexer",
                  ),
                  ProjectCard(
                    title: "HTTP Server",
                    description:
                        "Minimal multi-threaded HTTP server handling GET and POST using pure C++ and Linux syscalls\n\n\nC++ • Sockets • HTTP/1.1 • Linux • Web",
                    url: "https://github.com/carlosvts/http-server-cpp",
                  ),
                  ProjectCard(
                    title: "Raytracer",
                    description:
                        "Basic raycasting engine for 2D rendering shadow and emulate 'light'\n\n\nC++ • graphics • math • SFML",
                    url: "https://github.com/carlosvts/raytracing",
                  ),
                  ProjectCard(
                    title: "Sandbox Game",
                    description:
                        "Real-time physics sandbox game, with complex element interactions and custom cellular automata \n\n\nC++ • engine • physics • simulation • Raylib",
                    url: "https://github.com/carlosvts/sandbox-game",
                  ),
                  ProjectCard(
                    title: "Game of Life",
                    description:
                        "Interactive implementation of a colorful Conway's Game of Life cellular automata simulation\n\n\nC++ • SFML • simulation • cellular automata",
                    url: "https://github.com/carlosvts/GameOfLife",
                  ),
                  ProjectCard(
                    title: "Portfolio",
                    description:
                        "Source code for the portfolio that you are seeing, made with Flutter\n\n\nFlutter • Portfolio • Web development",
                    url: "https://github.com/carlosvts/portfolio",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
