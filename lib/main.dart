import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:ehaba_dating_app/screens/profile_details_page.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';
import 'package:ehaba_dating_app/screens/interested_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Lato'),
      home: interested_page(), //goi homescreen
    ),
  );
}
