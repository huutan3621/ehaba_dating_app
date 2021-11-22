import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
import 'package:ehaba_dating_app/screens/Notification/notification_message.dart';
import 'package:ehaba_dating_app/screens/Notification/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

        //Phần thân
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cài đặt',
                    style: TextStyle(
                      fontSize: 44.0,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avata.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Trâm Lương",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Cài đặt tài khoản",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              buildAccountOptionRow(context, "Đổi mật khẩu"),
              buildAccountOptionRow(context, "Người đã bỏ qua"),
              buildAccountOptionRow(context, "Danh sách chặn"),
              buildAccountOptionRow(context, "Báo cáo"),
              buildAccountOptionRow(context, "Đăng xuất"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Thêm",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              buildAccountOptionRow(context, "Về chúng tôi"),
              buildAccountOptionRow(context, "Pháp lí"),
            ],
          ),
        )));
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Ionicons.chevron_forward,
              size: 24.0,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
