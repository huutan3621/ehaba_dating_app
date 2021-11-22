import 'package:ehaba_dating_app/components/navigation_bar.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Raleway'),
      home: NavigationBar(), //goi homescreen
    ),
  );
}
