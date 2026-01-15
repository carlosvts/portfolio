import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/widgets/noteitem.dart';

// Redirects to note
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Navbar(),

          // Content
          Expanded(
            child: Center(
              child: ConstrainedBox(
                // constraint for width
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 48,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Page title
                      Text(
                        'Notes',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),

                      const SizedBox(height: 40),

                      // grid of notes
                      Expanded(
                        child: GridView.extent(
                          maxCrossAxisExtent: 420,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          childAspectRatio: 6, // list-like
                          children: [
                            // NoteItem(title: 'Memory allocation strategies'),
                            NoteItem(
                              title: "Why I take notes?",
                              slug: "why-i-take-notes",
                            ),
                            NoteItem(
                              title:
                                  "On Abstractions and How I Approach Learning",
                              slug:
                                  "on-abstraction-and-how-i-approach-learning",
                            ),
                            NoteItem(
                              title: "On Memory & CPU Architecture",
                              slug: "on-memory-and-cpu-architecture",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
