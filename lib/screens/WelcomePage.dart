import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/responsive.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
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
                    'Ế hả bạn? Vào đây cái là hết ế!',
                    style: TextStyle(
                      color: kLightTextColor,
                      fontStyle: FontStyle.italic,
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
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  //the sign up button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    onPressed: () {},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Chính sách và quyền riêng tư',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Lato',
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
