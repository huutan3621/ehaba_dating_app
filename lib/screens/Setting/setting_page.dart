import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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

        //Phần thân
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cài đặt',
                    style: TextStyle(
                      fontSize: 44.0,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/iconLogo.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Trâm Lương",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Cài đặt tài khoản",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              buildAccountOptionRow(context, "Đổi mật khẩu"),
              buildAccountOptionRow(context, "Người đã bỏ qua"),
              buildAccountOptionRow(context, "Danh sách chặn"),
              buildAccountOptionRow(context, "Báo cáo"),
              buildAccountOptionRow(context, "Đăng xuất"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Thêm",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              buildAccountOptionRow(context, "Về chúng tôi"),
              buildAccountOptionRow(context, "Pháp lí"),
            ],
          ),
        )));
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
              color: kPrimaryColor,
            ),
          ],
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
