import 'package:ehaba/bloc/authentication/authentication_bloc.dart';
import 'package:ehaba/bloc/signup/bloc.dart';
import 'package:ehaba/repositories/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ehaba/ui/constants.dart';
import 'package:ehaba/ui/widgets/constraint.dart';

class SignUpForm extends StatefulWidget {
  final UserRepository _userRepository;

  SignUpForm({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpBloc _signUpBloc;
  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignUpButtonEnabled(SignUpState state) {
    return isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);

    super.initState();
  }

  void _onFormSubmitted() {
    _signUpBloc.add(
      SignUpWithCredentialsPressed(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Đăng ký lỗi."),
                    Icon(Icons.error),
                  ],
                ),
              ),
            );
        }
        if (state.isSubmitting) {
          print("isSubmitting");
          ScaffoldMessenger.of(context)
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Đang đăng ký..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          print("Thành công");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: backgroundColour,
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.height / 3,
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
                        'ehaba',
                        style: TextStyle(
                          fontSize: 88.0,
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.normal,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        'Ế hả bạn? Vào đây cái là hết ế!',
                        style: TextStyle(
                          color: kLightTextColor,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (_) {
                        return !state.isEmailValid ? "Invalid Email" : null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: size.height * 0.02),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: TextFormField(
                      controller: _passwordController,
                      autocorrect: false,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (_) {
                        return !state.isPasswordValid
                            ? "Mật khẩu không hợp lệ"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        labelStyle: TextStyle(
                            color: Colors.black, fontSize: size.height * 0.02),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: GestureDetector(
                      onTap: isSignUpButtonEnabled(state)
                          ? _onFormSubmitted
                          : null,
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: isSignUpButtonEnabled(state)
                              ? Colors.white
                              : kPrimaryColor,
                          borderRadius:
                              BorderRadius.circular(size.height * 0.05),
                        ),
                        child: Center(
                          child: Text(
                            "Đăng ký",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onEmailChanged() {
    _signUpBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _signUpBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }
}
