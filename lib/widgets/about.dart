import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutAvatar extends StatelessWidget {
  const AboutAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 64,
      backgroundColor: Colors.transparent,
      // logo, maybe profile picture in future
      child: SvgPicture.asset("assets/icons/logo.svg", width: 64, height: 64),
    );
  }
}

class AboutName extends StatelessWidget {
  const AboutName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Carlos VTS',
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
      'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.',
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
        SizedBox(height: 8),
        // main text: description
        const AboutDescription(),

        SizedBox(height: 32),
      ],
    );
  }
}
