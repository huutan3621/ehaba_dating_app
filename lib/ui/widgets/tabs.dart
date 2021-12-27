import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ehaba/bloc/authentication/authentication_bloc.dart';
import 'package:ehaba/ui/constants.dart';
import 'package:ehaba/ui/pages/matches.dart';
import 'package:ehaba/ui/pages/messages.dart';
import 'package:ehaba/ui/pages/search.dart';
import 'package:ehaba/ui/widgets/constraint.dart';

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
    ];

    return Theme(
      data: ThemeData(
        primaryColor: backgroundColour,
        accentColor: Colors.white,
      ),
      child: DefaultTabController(
        length: 3,
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
                    TabBar(tabs: [
                      Tab(icon: Icon(Icons.search)),
                      Tab(icon: Icon(Icons.people)),
                      Tab(icon: Icon(Icons.message))
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
