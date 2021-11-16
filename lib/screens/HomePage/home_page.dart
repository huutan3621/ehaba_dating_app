import 'dart:ui';
import 'package:ehaba_dating_app/screens/SignIn/sign_in_page.dart';
import 'package:ehaba_dating_app/screens/jobs_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ehaba_dating_app/constraint.dart';

class home_page extends StatefulWidget {
  home_page({Key key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          title: Column(
            children: <Widget>[
              Text(
                'Trang chủ',
                style: TextStyle(
                  fontSize: 34.0,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.normal,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black26,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: IconButton(
                  icon: Icon(Icons.error),
                  color: kPrimaryColor,
                  onPressed: () {},
                ),
              ),
            )
          ]),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/iconHomePage.png'),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Bạn đang cô đơn',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 34,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryColor,
                      )),
                  Text(
                      '       Bạn đã cô đơn lâu quá rồi đấy\nHãy tìm một ai dó để trò chuyện nào.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return jobs_page();
                      }));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      'Bắt đầu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.notifications_active,
          Icons.message_rounded,
          Icons.settings
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
            // switch (val) {
            // case 0:
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            //   break;
            // case 1:
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            //   break;
            // case 2:
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            //   break;
            // case 3:
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            //   break;
            // }
          });
        },
        defaultSelectedIndex: 3,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(width: 4, color: kPrimaryColor),
                ),
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Color(0xFFD94343) : Colors.grey,
        ),
      ),
    );
  }
}
