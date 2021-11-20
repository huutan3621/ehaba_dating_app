import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
import 'package:ehaba_dating_app/screens/Notification/notification_page.dart';
import 'package:ehaba_dating_app/screens/Setting/setting_page.dart';
import 'package:flutter/material.dart';

class navigation_bar extends StatefulWidget {
  navigation_bar({Key key}) : super(key: key);

  @override
  _navigation_barState createState() => _navigation_barState();
}

class _navigation_barState extends State<navigation_bar> {
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    List<Widget> _screen = [
      home_page(),
      NotificationPage(),
      SettingPage(),
    ];
    int _selectedIndex = 0;
    void _onPageChanged(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    void _onItemTapped(int selectedIndex) {
      _pageController.jumpToPage(selectedIndex);
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        //physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_rounded,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
            ),
            title: Text('Home'),
          ),
        ],
      ),
    );
  }
}
