import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:newehaba/src/resources/widgets/input_decoration.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.height / 4,
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

              const SizedBox(height: 20),

              //Email
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  decoration: buildInputDecoration('Địa chỉ Email', null),
                ),
              ),

              //Password
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: buildInputDecoration('Mật khẩu', null),
                ),
              ),

              //Forget password
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          fontSize: 15,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //Nút chấp nhận
              MaterialButton(
                minWidth: double.infinity,
                height: 55,
                onPressed: () {
                  // TODO
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  'Chấp nhận',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
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
