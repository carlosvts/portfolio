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
  final VoidCallback onTap; // when click, like void(*onTap)() in C

  const NavLink({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(label),
        ),
      ),
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
        Expanded(flex: 2, child: NavLeft()),
        // Center
        Expanded(flex: 6, child: NavCenter()),
        // Right
        Expanded(flex: 2, child: NavRight()),
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
        Text('carlosvts'),
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
        Text("C / C++ / Linux / Memory"),
        Text("Learning: Flutter (Dart) / Rust"),
      ],
    );
  }
}

class HomeDescription extends StatelessWidget {
  const HomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Constantly learning how systems work beneath abstractions and how careful design leads to predictable software",
      ),
    );
  }
}

class HomeSignature extends StatelessWidget {
  const HomeSignature({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("learning how to communicate with the silicon"));
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeIdentity(),
                SizedBox(width: 12, height: 12),
                HomeRole(),
                SizedBox(width: 12, height: 12),
                HomeDescription(),
                SizedBox(width: 12, height: 12),
                HomeSignature(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
