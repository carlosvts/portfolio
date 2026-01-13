import 'package:flutter/material.dart';

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
        NavLink(label: "github", onTap: () {}),
        NavLink(label: "instagram", onTap: () {}),
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

class HomeLeft extends StatelessWidget {
  const HomeLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("carlosvts"),
        SizedBox(height: 12),
        Text("Low-Level, placeholder, foo, bar"),
      ],
    );
  }
}

class HomeRight extends StatelessWidget {
  const HomeRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blueGrey);
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: HomeLeft()),
        Expanded(flex: 4, child: HomeRight()),
      ],
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
          Expanded(
            flex: 1, // 10% of height
            child: Navbar(),
          ),

          // Conteúdo principal
          Expanded(
            flex: 9, // 90% of height
            child: HomeContent(),
          ),
        ],
      ),
    );
  }
}
