import 'package:flutter/material.dart';
import 'package:newehaba/src/resources/screens/welcome-screen/welcome_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: welcome_page(),
    );
  }
}