import 'package:flutter/material.dart';
import 'package:sirkel/src/presentation/main/main_page.dart';
import 'package:sirkel/theme/color_schemes.g.dart';
import 'package:sirkel/theme/common_typography.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sirkel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        fontFamily: CommonTypography.fontFamily,
        useMaterial3: false,
      ),
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => const MainPage(),
      },
    );
  }
}
