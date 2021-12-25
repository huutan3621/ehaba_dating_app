import 'package:ehaba/bloc/profile/bloc.dart';
import 'package:ehaba/repositories/userRepository.dart';
import 'package:ehaba/ui/constants.dart';
import 'package:ehaba/ui/widgets/constraint.dart';
import 'package:ehaba/ui/widgets/profileForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  final _userRepository;
  final userId;

  Profile({@required UserRepository userRepository, String userId})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
        userId = userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông tin cơ bản",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Lobster',
            fontSize: 34,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColour,
        elevation: 0,
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(userRepository: _userRepository),
        child: ProfileForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
