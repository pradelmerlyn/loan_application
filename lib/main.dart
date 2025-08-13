
import 'package:flutter/material.dart';
import 'package:loan/core/dependency_injection/injection_container.dart';

import 'core/util/theme/custom_app_theme.dart';
import 'presentation/login/screens/login_screen.dart';
void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomAppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }

}