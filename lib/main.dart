import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF000000),
            scaffoldBackgroundColor: Color(0xFF000000)),
        home: MainScreen()

        // home: const BmiPage2(),
        );
  }
}