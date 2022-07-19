import 'package:bugelas/constraints.dart';
import 'package:flutter/material.dart';
import 'package:bugelas/main_screen_new.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: blackBase,
        fontFamily: 'Poppins',
      ),
      title: 'Bugelas Catalog',
      home: MainScreenNew(),
    );
  }
}
