import 'package:flutter/material.dart';

import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.dark, home: const HomePage());
  }
}
