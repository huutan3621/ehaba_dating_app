import 'package:ehaba/bloc/authentication/authentication_bloc.dart';
import 'package:ehaba/ui/pages/messages.dart';
import 'package:ehaba/ui/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:ehaba/ui/pages/matches.dart';
import 'package:ehaba/ui/pages/search.dart';
import 'package:ehaba/ui/widgets/constraint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';

class Tabs extends StatelessWidget {
  final userId;

  const Tabs({this.userId});
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Search(userId: userId),
      Matches(
        userId: userId,
      ),
      Messages(userId: userId),
      SettingPage(),
    ];
    return Theme(
      data: ThemeData(
        primaryColor: backgroundColour,
        accentColor: Colors.white,
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'ehaba',
              style: TextStyle(
                  fontSize: 35.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  })
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                color: Colors.white,
                height: 48.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                              //text: 'Trang chủ',
                              icon: Icon(
                            Icons.home,
                            size: 20.0,
                            //color: kPrimaryColor,
                          )),
                          Tab(
                              icon: Icon(
                            Icons.notifications,
                            size: 24.0,
                            //color: kPrimaryColor,
                          )),
                          Tab(
                              icon: Icon(
                            Icons.message,
                            size: 24.0,
                            //color: kPrimaryColor,
                          )),
                          Tab(
                              icon: Icon(
                            Icons.settings,
                            size: 24.0,
                            //color: kPrimaryColor,
                          )),
                        ])
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}
