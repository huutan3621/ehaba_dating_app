import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
import 'package:ehaba_dating_app/screens/Message/message_page.dart';
import 'package:ehaba_dating_app/screens/Notification/notification_page.dart';
import 'package:ehaba_dating_app/screens/Setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int previousValue = 0;
  int index = 0;
  PageController _controller;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          children: [
            home_page(),
            NotificationPage(),
            MessagePage(),
            SettingPage(),
          ],
          onPageChanged: (page) {
            setState(() {
              index = page;
            });
          },
        ),
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  Widget buildBottomNavigation() {
    return BottomNavyBar(
      showElevation: false,
      backgroundColor: Colors.white,
      containerHeight: 60,
      selectedIndex: index <= 3 ? index : previousValue,
      onItemSelected: (index) => setState(() {
        this.index = index;
        if (index <= 3) {
          previousValue = index;
          _controller.jumpToPage(index);
        } else {
          _drawerKey.currentState.openEndDrawer();
        }
      }),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Ionicons.home),
          title: Text('Trang ch???',
              style: TextStyle(
                fontSize: 15.5,
              )),
          textAlign: TextAlign.center,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Ionicons.notifications),
          title: Text('Th??ng b??o',
              style: TextStyle(
                fontSize: 15.5,
              )),
          textAlign: TextAlign.center,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Ionicons.chatbubble),
          title: Text('Tin nh???n',
              style: TextStyle(
                fontSize: 15.5,
              )),
          textAlign: TextAlign.center,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Ionicons.settings),
          title: Text('C??i ?????t',
              style: TextStyle(
                fontSize: 15.5,
              )),
          textAlign: TextAlign.center,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}
