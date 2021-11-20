import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/HomePage/home_page.dart';
import 'package:ehaba_dating_app/screens/Setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'notification_message.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

        // Thanh navigationBar
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
              switch (val) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => home_page()));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                  break;
                // case 2:
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                //   break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                  break;
              }
            });
          },
          defaultSelectedIndex: 1,
        ),

        //App Bar
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          title: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(20, 15, 0, 0)),
              Text(
                'Thông báo',
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.normal,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = notifications[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chat.sender.name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  chat.time,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                chat.text,
                                style: chat.unread
                                    ? TextStyle(
                                        fontSize: 13, color: kPrimaryColor)
                                    : TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
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
