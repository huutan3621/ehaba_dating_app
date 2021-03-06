import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/chips/WrappedMultipleChipB.dart';
import 'package:ehaba_dating_app/screens/about_me_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'interested_page.dart';

class jobs_page extends StatefulWidget {
  jobs_page({Key key}) : super(key: key);

  @override
  _jobs_pageState createState() => _jobs_pageState();
}

class _jobs_pageState extends State<jobs_page> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar
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
                  return interested_page(); //back to the previous page
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
                          //2 text lines
                          Column(
                            children: <Widget>[
                              Text('Ngh??? nghi???p c???a b???n',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 34,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryColor,
                                  )),
                              Text(
                                  'H??y ch???n m???t ho???c v??i ngh??? nghi???p\nb???n ??ang l??m ????? m???i ng?????i bi???t v??? b???n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade900,
                                  ))
                            ],
                          ),
                        ],
                      ),

                      //chips choie B
                      Column(
                        children: <Widget>[
                          //choice chip
                          WrappedMultipleChipB(),
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
                                return about_me_page();
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: Text(
                              'Ti???p t???c',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]))));
  }
}
