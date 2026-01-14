import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void openGithub() {
  launchUrl(
    Uri.parse("https://github.com/carlosvts"),
    mode: LaunchMode.externalApplication,
  );
}

// Inkwell for handling states
class NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NavLink({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        // Changes text color on hover for contrast
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return theme.scaffoldBackgroundColor;
          }
          return theme.textTheme.bodyMedium?.color;
        }),
        // Changes background to accent color on hover
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return theme.colorScheme.primary;
          }
          return Colors.transparent;
        }),
        // Matches layout spacing
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        // Sharp corners
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        // Disables default splash effect
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Text(label),
    );
  }
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const NavIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      // inkweel needs a material, even if transparent
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.all((8)),
          child: Icon(icon, size: 20, color: Colors.white),
        ),
      ),
    );
  }
}

// Logo with name
class NavLeft extends StatelessWidget {
  const NavLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return NavLink(label: "carlosvts", onTap: () {});
  }
}

// Other routes
class NavCenter extends StatelessWidget {
  const NavCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavLink(label: "About", onTap: () {}),
        NavLink(
          label: "Projects",
          onTap: () {
            Navigator.pushNamed(context, "/projects");
          },
        ),
        NavLink(label: "Resume", onTap: () {}),
      ],
    );
  }
}

// Links for socials
class NavRight extends StatelessWidget {
  const NavRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavIcon(icon: MdiIcons.github, onTap: openGithub),
        NavIcon(icon: MdiIcons.linkedin, onTap: openGithub),
      ],
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left
        NavLeft(),
        // Center
        const Spacer(),
        // Right
        NavRight(),
      ],
    );
  }
}

class HomeIdentity extends StatelessWidget {
  const HomeIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/icons/logo.svg", width: 32, height: 32),
        SizedBox(height: 8, width: 8),
        Text('carlosvts', style: Theme.of(context).textTheme.displayLarge),
      ],
    );
  }
}

class HomeRole extends StatelessWidget {
  const HomeRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Low-Level systems engineer"),
        SizedBox(width: 8, height: 8),
        Text(
          "C / C++ / Linux / Memory",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          "Learning: Flutter (Dart) / Rust",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class HomeDescription extends StatelessWidget {
  const HomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Text(
          "Constantly learning how systems work beneath abstractions and how careful design leads to predictable software",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class HomeSignature extends StatelessWidget {
  const HomeSignature({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "learning how to communicate with the silicon",
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontStyle: FontStyle.italic),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navbar
          Expanded(flex: 1, child: Navbar()),

          // Content
          Expanded(
            flex: 9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start, // at the top
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // some margin between navbar and main content, looks smoother
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ), // 15% screen size padding
                HomeIdentity(),
                SizedBox(height: 16),
                HomeRole(),
                SizedBox(height: 24),
                HomeDescription(),
                SizedBox(height: 32),
                HomeSignature(),
                SizedBox(height: 40),
                NavCenter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
