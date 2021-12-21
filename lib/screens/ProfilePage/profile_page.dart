import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/HomePage/match_page.dart';
import 'package:ehaba_dating_app/screens/Message/Chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            //back button
            icon: Icon(
              Ionicons.chevron_back,
              color: kPrimaryColor,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return match_page(); //back to the previous page
              }));
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/avata.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.white,
                              textColor: kPrimaryColor,
                              child: Icon(
                                Ionicons.close,
                                size: 30,
                              ),
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ChatDetailPage(); //back to the previous page
                                }));
                              },
                              color: Colors.white,
                              textColor: kPrimaryColor,
                              child: Icon(
                                Icons.mail_rounded,
                                size: 50,
                              ),
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.white,
                              textColor: kPrimaryColor,
                              child: Icon(
                                Ionicons.heart,
                                size: 30,
                              ),
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name and age
                    Text(
                      'Trâm Lương, 20',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sinh viên',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //location
                    Text(
                      'Vị trí',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Thủ Đức, Tp. Hồ Chí Minh',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //interested
                    Text(
                      'Sở thích',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        'Nghe nhạc',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //about me
                    Text(
                      'Giới thiệu',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên Tôi là sinh viên',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //pictures
                    Text(
                      'Thư viện',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
