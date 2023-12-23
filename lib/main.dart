import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:pwa/client.dart' as pwa;

void main() {
  new pwa.Client();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            defaultTargetPlatform: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      title: 'BMI Calculator',
      home: InputPage(),
    );
  }
}

class FadeTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) =>
      FadeTransition(opacity: animation, child: child);
}
