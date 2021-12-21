
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constraint.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
    runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'Raleway'),
      home: const welcome_page(), //goi homescreen
    ),
  );
}
