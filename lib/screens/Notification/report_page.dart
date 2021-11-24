import 'package:ehaba_dating_app/components/navigation_bar.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ehaba_dating_app/screens/jobs_page.dart';
import 'package:flutter/cupertino.dart';

class report_page extends StatefulWidget {
  report_page({Key key}) : super(key: key);

  @override
  _report_pageState createState() => _report_pageState();
}

class _report_pageState extends State<report_page> {
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
                Ionicons.chevron_back,
                color: kPrimaryColor,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NavigationBar(); //back to the previous page
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
                              Text('Hãy báo cáo\nvấn đề của bạn',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 34,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryColor,
                                  )),
                            ],
                          ),
                        ],
                      ),

                      MaterialButton(
                          minWidth: double.infinity,
                          height: 55,
                          color: kSubColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Ionicons.images,
                                color: kPrimaryColor,
                                size: 24,
                              ),
                              SizedBox(width: 14.0),
                              Text('Chọn hình ảnh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kPrimaryColor,
                                  ))
                            ],
                          )),

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
                                labelText: 'Chi tiết',
                                hintText: 'Chi tiết về lỗi bạn đã gặp',
                                labelStyle: TextStyle(
                                    color: kPrimaryColor), //color of text
                                //change style when focused
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(24.0))))),
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
                                return jobs_page();
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
                    ]))));
  }
}
