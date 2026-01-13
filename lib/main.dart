import 'package:flutter/material.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/app/routes.dart';
import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/theme/app_theme.dart';

void main() {
  runApp(App());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.dark,
      initialRoute: '/',
      routes: routes,
    );
  }
}
