import 'dart:ui';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/interested_page.dart';
import 'package:ehaba_dating_app/screens/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/responsive.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class profile_details_page extends StatefulWidget {
  profile_details_page({Key? key}) : super(key: key);

  @override
  _profile_details_pageState createState() => _profile_details_pageState();
}

class _profile_details_pageState extends State<profile_details_page> {
  //gender
  List<String> _gender = ["Nam", "Nữ", "Khác"];
  String? _selectedColor;
  //date picker
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        //customize date picker
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kPrimaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kPrimaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

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
                  return welcome_page(); //back to the previous page
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: <Widget>[
                              Text('Thông tin cá nhân',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 34,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryColor,
                                  )),
                              Text(
                                  'Hãy là chính bạn vì mỗi cá nhân\nđều rất đặc biệt',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade900,
                                  ))
                            ],
                          ),
                        ],
                      ),

                      //input avatar
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 52,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/tan01.jpg"),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: kSubColor,
                                        child: Icon(
                                          Ionicons.camera,
                                          color: kPrimaryColor,
                                          size: 24,
                                        )),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),

                      //a group of button
                      Column(
                        children: <Widget>[
                          //input first name form
                          Container(
                            width: double.infinity,
                            height: 58,
                            child: TextFormField(
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              24.0)), //border when the form is not focused
                                    ),
                                    labelText: 'Tên của bạn',
                                    hintText: 'Nhập tên của bạn',
                                    labelStyle: TextStyle(
                                        color: kPrimaryColor), //color of text
                                    //change style when focused
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kPrimaryColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24.0))))),
                          ),

                          SizedBox(
                            height: 12.0,
                          ),

                          //input name
                          Container(
                            width: double.infinity,
                            height: 58,
                            child: TextFormField(
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              24.0)), //border when the form is not focused
                                    ),
                                    labelText: 'Họ của bạn',
                                    hintText: 'Nhập họ của bạn',
                                    labelStyle: TextStyle(
                                      color: kPrimaryColor,
                                    ), //color of text
                                    //change style when focused
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kPrimaryColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24.0))))),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          //select gender
                          Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(24)),
                            child: DropdownButton<String>(
                              onChanged: (value) {
                                setState(() {
                                  _selectedColor = value;
                                });
                              },
                              value: _selectedColor,

                              // Hide the default underline
                              underline: Container(),
                              hint: Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '   Lựa chọn giới tính',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 16),
                                  ),
                                ),
                              ),

                              isExpanded: true,

                              // The list of options
                              items: _gender
                                  .map((e) => DropdownMenuItem(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            e,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        value: e,
                                      ))
                                  .toList(),

                              // Customize the selected item
                              selectedItemBuilder: (BuildContext context) =>
                                  _gender
                                      .map(
                                        (e) => Padding(
                                          padding: EdgeInsets.only(left: 11.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          //calendar
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                  minWidth: double.infinity,
                                  height: 55,
                                  color: kSubColor,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                  onPressed: _showDatePicker,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Ionicons.calendar,
                                        color: kPrimaryColor,
                                        size: 24,
                                      ),
                                      SizedBox(width: 14.0),
                                      Text(
                                          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: kPrimaryColor,
                                          ))
                                    ],
                                  ))
                            ],
                          ),
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
