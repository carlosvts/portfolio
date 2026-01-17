import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/pages/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 650 ? 1 : (screenWidth < 1000 ? 2 : 3);
    double aspectRatio = screenWidth < 650 ? 1.6 : 0.85;

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
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,

                children: const [
                  ProjectCard(
                    title: "Chip-8",
                    description:
                        "A virtual machine that implements the Chip-8 instruction set. It handles a memory map of 4KB, 16 general-purpose registers, a dedicated program counter, and a stack for subroutine calls. The emulator manages the 60Hz delay and sound timers while rendering the monochrome display buffer using SDL2.\n\n\nC • CHIP8 • emulation • SDL2",
                    url: "https://github.com/carlosvts/chip8",
                  ),
                  ProjectCard(
                    title: "Bitmap parser",
                    description:
                        "A zero-dependency parser designed to read and manipulate BMP files at the byte level. It extracts file headers and pixel arrays into raw buffers, allowing for the application of manual convolution kernels to perform image filtering operations like gausian blur and Sobel's edge detection without external libraries.\n\n\nC++ • parsing • image processing • image filtering",
                    url: "https://github.com/carlosvts/raw-image-processor",
                  ),
                  ProjectCard(
                    title: "Malloc implementation",
                    description:
                        "A custom dynamic memory allocator that provides implementations for malloc, calloc, realloc, and free. It interacts with the Linux kernel via the sbrk syscall and manages the heap segment using a doubly linked list structure to track allocated and free memory blocks, handling block splitting and merging.\n\n\nC • memory • syscalls • low-level",
                    url: "https://github.com/carlosvts/malloc-implementation",
                  ),
                  ProjectCard(
                    title: "Input multiplexer",
                    description:
                        "A Linux utility that monitors multiple input event devices simultaneously (Mouse and Keyboard). It uses the epoll system call to implement an asynchronous I/O multiplexing loop, reading raw event structures from /dev/input/ and parsing hexadecimal data from keyboard and mouse devices in a single-threaded execution flow. Can be expanded into almost any device at /dev/input \n\n\nC++ • Linux • epoll • concurrency • evdev",
                    url: "https://github.com/carlosvts/input-multiplexer",
                  ),
                  ProjectCard(
                    title: "HTTP Server",
                    description:
                        "A multi-threaded HTTP/1.1 server built using the Linux socket API. It manually handles the TCP handshake, parses raw string requests into method/path components, and constructs valid HTTP response headers and body payloads. Concurrency is managed through a thread-per-connection model using POSIX threads.\n\nC++ • Sockets • HTTP/1.1 • Linux • Network",
                    url: "https://github.com/carlosvts/http-server-cpp",
                  ),
                  ProjectCard(
                    title: "Raytracer",
                    description:
                        "A 2D raycasting engine that calculates light and shadow visibility through geometric intersections. It casts rays from a central source and computes the nearest collision point with environment segments using linear algebra, rendering the resulting visibility polygon into an SFML window buffer.\n\n\nC++ • graphics • math • SFML • geometry",
                    url: "https://github.com/carlosvts/raytracing",
                  ),
                  ProjectCard(
                    title: "Sandbox Game",
                    description:
                        "A real-time physics simulation based on cellular automata rules. Each pixel in the grid acts as an individual element with specific density and state properties. The engine updates the grid every frame, calculating interactions between falling solids, flowing liquids, and expanding gases based on neighbor-state logic.\n\n\nC++ • engine • physics • simulation • Raylib",
                    url: "https://github.com/carlosvts/sandbox-game",
                  ),
                  ProjectCard(
                    title: "Game of Life",
                    description:
                        "An implementation of Conway's Game of Life that simulates cellular evolution on a discrete 2D grid. The program applies the four standard transition rules to each cell state simultaneously and uses SFML to render the grid, allowing for real-time interaction with the initial seed. \n\n\nC++ • SFML • simulation • cellular automata",
                    url: "https://github.com/carlosvts/GameOfLife",
                  ),
                  ProjectCard(
                    title: "Portfolio",
                    description:
                        "The source code for this web-based portfolio. It is built using the Flutter framework and Dart, focusing on a custom layout architecture to showcase low-level C++ projects. The deployment is automated via GitHub Actions, serving the compiled JavaScript and CanvasKit assets through GitHub Pages.\n\nFlutter • Dart • Portfolio • Web development",
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
