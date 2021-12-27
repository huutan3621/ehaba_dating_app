import 'package:ehaba/ui/pages/matches.dart';
import 'package:ehaba/ui/pages/messaging.dart';
import 'package:ehaba/ui/pages/search.dart';
import 'package:ehaba/ui/pages/settings.dart';
import 'package:ehaba/ui/widgets/constraint.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  int badge = 0;
  final List<Widget> screens = [
    Search(),
    Matches(),
    Messaging(),
    SettingPage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Search();
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
            badge = badge + 1;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          return screens[position];
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GNav(
                rippleColor: kPrimaryColor.withOpacity(0.7),
                hoverColor: kPrimaryColor.withOpacity(0.8),
                haptic: true, // haptic feedback
                tabBorderRadius: 20,
                duration: Duration(milliseconds: 500), // tab animation duration
                gap: 6, // the tab button gap between icon and text
                color: kPrimaryColor.withOpacity(0.9), // unselected icon color
                activeColor: Colors.white, // selected icon and text color
                iconSize: 25, // tab button icon size
                tabBackgroundColor: kPrimaryColor.withOpacity(0.9),
                //mainColor.withOpacity(0.7), // selected tab background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.search,
                    text: 'Searchs',
                    onPressed: () {
                      setState(() {
                        currentScreen = Search();
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: 'Notifications',
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: 'Message',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });

                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}