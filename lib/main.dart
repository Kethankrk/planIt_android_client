import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:planit/providers/navbar_provider.dart';
import 'package:planit/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NavbarProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => FTheme(
        data: FThemes.zinc.dark,
        child: child!,
      ),
      title: 'PlanIt',
      routerConfig: customGoRouter,
    );
  }
}
