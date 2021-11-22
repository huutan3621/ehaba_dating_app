import 'package:ehaba_dating_app/screens/profile_details_page.dart';
import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/components/input_decoration.dart';
import 'package:ionicons/ionicons.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Ionicons.chevron_back,
            color: kPrimaryColor,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.height / 4,
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
                    'Đổi mật khẩu',
                    style: TextStyle(
                      fontSize: 44.0,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              //Email
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  decoration: buildInputDecoration('Địa chỉ Email'),
                ),
              ),

              //Password
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: buildInputDecoration('Mật khẩu'),
                ),
              ),

              //Nhập lại Password
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: buildInputDecoration('Nhập lại mật khẩu'),
                ),
              ),

              SizedBox(height: 27),

              //Nút chấp nhận
              MaterialButton(
                minWidth: double.infinity,
                height: 55,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => profile_details_page()));
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Tiếp tục',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
