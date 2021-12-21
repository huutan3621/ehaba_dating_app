import 'dart:ui';
import 'package:ehaba_dating_app/screens/HomePage/match_page.dart';
import 'package:ehaba_dating_app/screens/HomePage/pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ionicons/ionicons.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          title: Text(
            'Trang chủ',
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: 'Lobster',
              fontWeight: FontWeight.normal,
              color: kPrimaryColor,
            ),
          ),
          //filter button
          actions: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black26,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: IconButton(
                  icon: Icon(Ionicons.filter),
                  color: kPrimaryColor,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => pop_up());
                  },
                ),
              ),
            )
          ]),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //icon logo
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/iconHomePage.png'),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
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
              //2 lines of text
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Bạn đang cô đơn',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 34,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryColor,
                      )),
                  Text(
                      '       Bạn đã cô đơn lâu quá rồi đấy\nHãy tìm một ai đó để trò chuyện nào.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      )),
                ],
              ),
              //start bbutton
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return match_page();
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      'Bắt đầu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
