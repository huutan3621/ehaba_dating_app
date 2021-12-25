import 'package:ehaba/bloc/signup/bloc.dart';
import 'package:ehaba/repositories/userRepository.dart';
import 'package:ehaba/ui/constants.dart';
import 'package:ehaba/ui/widgets/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  final UserRepository _userRepository;

  SignUp({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đăng ký",
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: backgroundColour,
        elevation: 0,
      ),
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          userRepository: _userRepository,
        ),
        child: SignUpForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}