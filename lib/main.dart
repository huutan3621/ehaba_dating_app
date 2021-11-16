import 'package:ehaba_dating_app/screens/Notification/notification1.dart';
import 'package:ehaba_dating_app/screens/about_me_page.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Raleway'),
      home: about_me_page(), //goi homescreen
    ),
  );
}
