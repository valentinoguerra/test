import 'package:flutter/material.dart';
import 'package:test_project/UI/landing/landing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color color1 = Color(0xFF348df5);
    final Color color2 = Color(0xFFF0F0F0);
    final Color color3 = Color(0xFFAFAFAF);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: color1,
        accentColor: color2,
        unselectedWidgetColor: Colors.white,
        disabledColor: Colors.white,
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: color3),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(color: color1, fontSize: 40, fontWeight: FontWeight.bold),
              headline2: TextStyle(
                color: color1,
                fontSize: 24,
              ),
              headline3: TextStyle(color: color1, fontSize: 20, fontWeight: FontWeight.bold),
              headline4: TextStyle(
                color: color1,
                fontSize: 18,
              ),
              headline5: TextStyle(
                color: color1,
                fontSize: 12,
              ),
            ),
      ),
      home: LandingScreen(),
    );
  }
}