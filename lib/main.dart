import 'package:ehaba_dating_app/components/navigation_bar.dart';
import 'package:ehaba_dating_app/screens/Message/Chat/chat_page.dart';
import 'package:ehaba_dating_app/screens/Notification/report_page.dart';
import 'package:ehaba_dating_app/screens/ProfilePage/profile_page.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Raleway'),
      home: welcome_page(), //goi homescreen
    ),
  );
}
