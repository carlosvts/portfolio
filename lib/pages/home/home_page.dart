import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/navbar.dart';

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
