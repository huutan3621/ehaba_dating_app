import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
<<<<<<< HEAD
import 'package:ehaba_dating_app/screens/HomePage/match_page.dart';
=======
import 'package:ehaba_dating_app/screens/Message/Chat/chat_page.dart';
>>>>>>> 3acc8a1cfa7b6052c17fa4b0ec55db320ac5b73c
import 'package:ehaba_dating_app/screens/Notification/notification1.dart';
import 'package:ehaba_dating_app/screens/about_me_page.dart';
import 'package:ehaba_dating_app/components/navigation_bar.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Raleway'),
<<<<<<< HEAD
      home: match_page(), //goi homescreen
=======
      home: NavigationBar(), //goi homescreen
>>>>>>> 3acc8a1cfa7b6052c17fa4b0ec55db320ac5b73c
    ),
  );
}
