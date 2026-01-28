import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter/services.dart' show rootBundle;

// Markdown parser
class _MarkdownBlock {
  final String content;
  final bool isLatex;

  _MarkdownBlock(this.content, this.isLatex);
}

// Parses $$ $$ to LaTeX
List<_MarkdownBlock> splitMarkdownAndLatex(String input) {
  final regex = RegExp(r'\$\$(.*?)\$\$', dotAll: true);
  final blocks = <_MarkdownBlock>[];

  int lastIndex = 0;

  for (final match in regex.allMatches(input)) {
    if (match.start > lastIndex) {
      blocks.add(
        _MarkdownBlock(input.substring(lastIndex, match.start), false),
      );
    }

    blocks.add(_MarkdownBlock(match.group(1)!.trim(), true));

    lastIndex = match.end;
  }

  if (lastIndex < input.length) {
    blocks.add(_MarkdownBlock(input.substring(lastIndex), false));
  }

  return blocks;
}

// A little button that goes back to the notes section
class BackToNotes extends StatelessWidget {
  const BackToNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/notes'),
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(Size.zero),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return theme.scaffoldBackgroundColor;
            }
            return theme.textTheme.bodyMedium?.color;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return theme.colorScheme.primary;
            }
            return Colors.transparent;
          }),
          // Sharp corners
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: const Text('← Back'),
      ),
    );
  }
}

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
          BackToNotes(),

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

                final blocks = splitMarkdownAndLatex(snapshot.data!);

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: blocks.map((block) {
                          if (block.isLatex) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Math.tex(
                                block.content,
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                              ),
                            );
                          }

                          return MarkdownBody(
                            data: block.content,
                            selectable: true,
                            imageBuilder: (uri, title, alt) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                ),
                                child: Image.asset(
                                  uri.toString(),
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                            styleSheet:
                                MarkdownStyleSheet.fromTheme(
                                  Theme.of(context),
                                ).copyWith(
                                  h1Padding: const EdgeInsets.only(
                                    top: 32,
                                    bottom: 20,
                                  ),
                                  h2Padding: const EdgeInsets.only(
                                    top: 28,
                                    bottom: 16,
                                  ),
                                  h3Padding: const EdgeInsets.only(
                                    top: 24,
                                    bottom: 12,
                                  ),
                                  pPadding: const EdgeInsets.only(bottom: 16),
                                  listBulletPadding: const EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  codeblockPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 12,
                                  ),
                                  blockquotePadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                  h1: Theme.of(context).textTheme.displaySmall
                                      ?.copyWith(
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF5EEAD4),
                                      ),
                                  h2: Theme.of(context).textTheme.headlineMedium
                                      ?.copyWith(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  h3: Theme.of(context).textTheme.headlineSmall
                                      ?.copyWith(fontSize: 22),
                                  p: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(fontSize: 17, height: 1.6),
                                  code: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'monospace',
                                  ),
                                  blockquoteDecoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest
                                        .withValues(alpha: 0.3),
                                    border: const Border(
                                      left: BorderSide(
                                        color: Color(0xFF5EEAD4),
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                ),
                          );
                        }).toList(),
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
