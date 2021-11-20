import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/Notification/notification_page.dart';
import 'package:ehaba_dating_app/screens/Setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import 'home_page.dart';

class match_page extends StatefulWidget {
  @override
  _match_pageState createState() => _match_pageState();
}

class _match_pageState extends State<match_page> {
  //card controller
  TCardController _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          title: Text(
            'Trang chủ',
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: 'Lobster',
              fontWeight: FontWeight.normal,
              color: kPrimaryColor,
            ),
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
                  icon: Icon(Icons.error_rounded),
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
          //swipe card here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TCard(
                cards: cards,
                size: Size(360, 480),
                controller: _controller,
                onForward: (index, info) {
                  print(index);
                },
                onBack: (index, info) {
                  print(index);
                },
                onEnd: () {
                  print('end');
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      print(_controller);
                      _controller.back();
                    },
                    child: Text('Back'),
                  ),
                  OutlineButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    child: Text('Reset'),
                  ),
                  OutlineButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: Text('Forward'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//cards details
List<String> images = [
  'https://media1.popsugar-assets.com/files/thumbor/d4kZB_JE3YdxtnPyVOjJF64ggeo/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2017/11/30/800/n/1922398/169fe2249b4b40fe_GettyImages-468038186/i/Freddie-Highmore-Facts.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/8/89/Chris_Evans_2020_%28cropped%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sebastian_Stan_by_Gage_Skidmore_2_%28cropped%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg',
  'https://m.media-amazon.com/images/M/MV5BMjE2MjI2OTk1OV5BMl5BanBnXkFtZTgwNTY1NzM4MDI@._V1_.jpg',
];

//card decoration
List<Widget> cards = List.generate(
  images.length,
  (int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23.0,
            spreadRadius: -13.0,
            color: Colors.black54,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  },
);

//navigation bar
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
