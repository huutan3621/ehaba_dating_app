import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/chips/WrappedMultipleChip.dart';
import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
import 'package:ehaba_dating_app/screens/jobs_page.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'profile_details_page.dart';

class about_me_page extends StatefulWidget {
  about_me_page({Key key}) : super(key: key);

  @override
  _about_me_pageState createState() => _about_me_pageState();
}

class _about_me_pageState extends State<about_me_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //hide header shadow
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            //back button
            icon: Icon(
              Ionicons.chevron_back,
              color: kPrimaryColor,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return jobs_page(); //back to the previous page
              }));
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Giới thiệu về bạn',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 34,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryColor,
                      )),
                  Text(
                      'Hãy thêm vài dòng giới thiệu\nđể mọi người hiểu về bạn hơn.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      )),
                ],
              ),
              Container(
                width: double.infinity,
                child: TextField(
                    maxLines: 24,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              24.0)), //border when the form is not focused
                        ),
                        //labelText: 'Giới thiệu về bạn',
                        hintText: 'Nhập vài dòng giới thiệu về bạn',
                        labelStyle:
                            TextStyle(color: kPrimaryColor), //color of text
                        //change style when focused
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return welcome_page();
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      'Hoàn thành',
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
