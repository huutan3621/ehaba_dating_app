import 'package:ehaba/bloc/authentication/authentication_bloc.dart';
import 'package:ehaba/ui/pages/messages.dart';
import 'package:ehaba/ui/pages/setting.dart';
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
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Text(
              'ehaba',
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  })
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                color: kPrimaryColor,
                height: 48.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      // indicator: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
                      tabs: [
                      Tab(
                          icon: Icon(
                        Icons.search,
                        size: 24.0,
                        color: Colors.white,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.notifications,
                        size: 24.0,
                        color: Colors.white,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.message,
                        size: 24.0,
                        color: Colors.white,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.person,
                        size: 24.0,
                        color: Colors.white,
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
