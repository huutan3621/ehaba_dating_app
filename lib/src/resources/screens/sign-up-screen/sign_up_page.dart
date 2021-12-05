
import 'package:flutter/material.dart';
import 'package:newehaba/src/blocs/sign_up_bloc.dart';
import 'package:newehaba/src/resources/screens/sign-in-screen/sign_in_page.dart';
import '../../../constants.dart';
import '../../widgets/input_decoration.dart';
import 'package:ionicons/ionicons.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpBLoc bloc = new SignUpBLoc();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _repasswordController = new TextEditingController();

  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
            Ionicons.chevron_back,
            color: kPrimaryColor,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        //bottom: false,
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
                    'Đăng ký',
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

              //Email
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) => TextFormField(
                    controller: _emailController,
                    decoration: buildInputDecoration('Địa chỉ Email', snapshot.hasError ? snapshot.error.toString() : null),
                  ),
                )
              ),

              //Password
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: StreamBuilder(
                  stream: bloc.passwordStream,
                  builder: (context, snapshot) => TextFormField(
                    controller: _passwordController,
                    autocorrect: false,
                    obscureText: true,
                    decoration: buildInputDecoration('Mật khẩu', snapshot.hasError ? snapshot.error.toString() : null),
                  ),
                )
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: StreamBuilder(
                  stream: bloc.repasswordStream,
                  builder: (context, snapshot) => TextFormField(
                    controller: _repasswordController,
                    autocorrect: false,
                    obscureText: true,
                    decoration: buildInputDecoration('Nhập lại mật khẩu', snapshot.hasError ? snapshot.error.toString() : null),
                  ),
                )
              ),

              SizedBox(height: 20),

              //Nút chấp nhận
              MaterialButton(
                minWidth: double.infinity,
                height: 55,
                onPressed: (){
                    if(bloc.isValidInfo(_emailController.text, _passwordController.text, _repasswordController.text)){
                      print("true");
                    }
                    else{
                      print("fail");
                    }
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
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
