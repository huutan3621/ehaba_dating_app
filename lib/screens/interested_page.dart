import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/chips/WrappedMultipleChip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'profile_details_page.dart';
import 'package:chips_choice/chips_choice.dart';

class interested_page extends StatefulWidget {
  interested_page({Key key}) : super(key: key);

  @override
  _interested_pageState createState() => _interested_pageState();
}

class _interested_pageState extends State<interested_page> {
  bool isSelected = false;
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
                Icons.arrow_back_ios,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return profile_details_page(); //back to the previous page
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
                    children: <Widget>[
                      //slogan row
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: <Widget>[
                              Text('Sở thích của bạn',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 34,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryColor,
                                  )),
                              Text(
                                  'Hãy chọn một vài sở thích \n để mọi người hiểu về bạn hơn',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade900,
                                  ))
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          //choice chip
                          WrappedMultipleChip(),
                        ],
                      ),

                      // the continue button
                      Column(
                        children: <Widget>[
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 55,
                            color: kPrimaryColor,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return interested_page();
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: Text(
                              'Tiếp tục',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]))));
  }
}
