import 'package:ehaba_dating_app/screens/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Lato'),
      home: WelcomePage(), //goi homescreen
    ),
  );
}
