import 'dart:ui';
import 'package:newehaba/src/resources/screens/sign-in-screen/sign_in_page.dart';
import 'package:newehaba/src/resources/screens/sign-up-screen/sign_up_page.dart';

import '../../../constants.dart';
import 'package:flutter/material.dart';


class welcome_page extends StatelessWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/iconLogo.png'),
                  ),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 60.0, // soften the shadow
                      spreadRadius: 16.0, //extend the shadow
                      offset: const Offset(
                        16.0, // Move to right 16  horizontally
                        16.0, // Move to bottom 16 Vertically
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: const <Widget>[
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
                      fontStyle: FontStyle.normal,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //the sign up button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Chính sách và quyền riêng tư',
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
