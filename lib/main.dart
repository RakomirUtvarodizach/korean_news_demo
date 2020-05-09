import 'package:flutter/material.dart';

import 'screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korea/Serbia News App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
