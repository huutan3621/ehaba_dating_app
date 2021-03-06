import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/SignIn/sign_in_page.dart';
import 'package:ehaba_dating_app/screens/SignUp/sign_up_page.dart';
import 'package:ehaba_dating_app/screens/profile_details_page.dart';
import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/responsive.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/iconLogo.png'),
                  ),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 60.0, // soften the shadow
                      spreadRadius: 16.0, //extend the shadow
                      offset: Offset(
                        16.0, // Move to right 16  horizontally
                        16.0, // Move to bottom 16 Vertically
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'ehaba',
                    style: TextStyle(
                      fontSize: 88.0,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    '??? h??? b???n? V??o ????y c??i l?? h???t ???!',
                    style: TextStyle(
                      color: kLightTextColor,
                      fontStyle: FontStyle.normal,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Column(
                children: <Widget>[
                  // the sign in button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      '????ng k??',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //the sign up button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      '????ng nh???p',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Ch??nh s??ch v?? quy???n ri??ng t??',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
