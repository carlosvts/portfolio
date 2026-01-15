import 'package:flutter/material.dart';

class AboutAvatar extends StatelessWidget {
  const AboutAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 150,
      backgroundColor: Colors.transparent,
      // logo, maybe profile picture in future
      backgroundImage: AssetImage('assets/images/eu.jpeg'),
    );
  }
}

class AboutName extends StatelessWidget {
  const AboutName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'CarlosVTS',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'I’m a systems-oriented developer focused on low-level programming and operating systems. I enjoy learning how software behaves beneath abstractions, especially regarding memory management and performance.',
      textAlign: TextAlign.center,
      //style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        // avatar
        const AboutAvatar(),
        SizedBox(height: 24),
        // name
        const AboutName(),
        SizedBox(height: 56),
        // main text: description
        const AboutDescription(),

        SizedBox(height: 32),
      ],
    );
  }
}
