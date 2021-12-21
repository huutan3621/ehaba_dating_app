import 'package:ehaba_dating_app/bloc/AuthBloc.dart';
import 'package:ehaba_dating_app/components/navigation_bar.dart';
import 'package:ehaba_dating_app/dialog/loading_dialog.dart';
import 'package:ehaba_dating_app/dialog/msg_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/components/input_decoration.dart';
import 'package:ionicons/ionicons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool remember = false;
  final _formkey = GlobalKey<FormState>();

  AuthBloc authBloc = new AuthBloc();
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
                    'Đăng nhập',
                    style: TextStyle(
                      fontSize: 44.0,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Column(
                children: <Widget>[
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
                  //Forget password
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                              fontSize: 15,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Nhập sai mật khẩu',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              //Nút chấp nhận
              MaterialButton(
                minWidth: double.infinity,
                height: 55,
                onPressed: _onLoginClick,
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Chấp nhận',
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
    void _onLoginClick() {
    String email = _emailController.text;
    String pass = _passController.text;

    if(_formkey.currentState!.validate()) {
      LoadingDialog.showLoadingDialog(context, "Loading...");
      }
      authBloc.signIn(
          email,
          pass,
          () {
                LoadingDialog.hideLoadingDialog(context);
                Navigator.pushReplacementNamed(context, "tab_page");
            },
          (msg) {
                    LoadingDialog.hideLoadingDialog(context);
                    MsgDialog.showMsgDialog(context, "Đăng nhập thất bại", msg);
              });
    }

}
