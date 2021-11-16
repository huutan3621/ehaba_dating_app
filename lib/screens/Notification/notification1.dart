import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/constraint.dart';

class Notification1 extends StatefulWidget {
  const Notification1({Key key}) : super(key: key);

  @override
  _Notification1State createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      //App Bar
      appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          title: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(20, 15, 0, 0)),
              Text(
                'Thông báo',
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
        defaultSelectedIndex: 1,
      ),

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    width: MediaQuery.of(context).size.height / 3.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/avata.png'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Quân A.P',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '24 tuổi',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Column(
                children: <Widget>[
                  Text(
                    'Lời mời ghép đôi',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 8,),

              Text(
                'Hãy bắt đầu trò chuyện để tìm hiểu nhau',
                style: TextStyle(
                  color: kLightTextColor,
                  fontSize: 14.0,
                ),
              ),

              SizedBox(height: 20),

              //Nút chấp nhận
              MaterialButton(
                minWidth: double.infinity,
                height: 58,
                onPressed: () {},
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Chấp nhận',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),

              //Bỏ qua
              MaterialButton(
                minWidth: double.infinity,
                height: 58,
                onPressed: () {},
                color: kSubColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Bỏ qua',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
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
