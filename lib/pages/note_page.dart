import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadNote(String slug) async {
  final String path = 'assets/markdown/$slug.md';
  return await rootBundle.loadString(path);
}

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
            child: FutureBuilder(
              future: loadNote(slug),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Note not found ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      "No content in this note",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Padding(
                      padding: const EdgeInsetsGeometry.all(32),
                      child: MarkdownBody(
                        data: snapshot.data!,
                        selectable: true,
                        styleSheet:
                            MarkdownStyleSheet.fromTheme(
                              Theme.of(context),
                            ).copyWith(
                              h1: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF5EEAD4), // accent
                                  ),
                              h2: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                              h3: Theme.of(
                                context,
                              ).textTheme.headlineSmall?.copyWith(fontSize: 22),
                              p: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontSize: 17, height: 1.6),
                              code: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'monospace',
                              ),
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
