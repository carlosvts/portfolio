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

class NavLeft extends StatelessWidget {
  const NavLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return NavLink(
      label: "carlosvts",
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
    );
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
