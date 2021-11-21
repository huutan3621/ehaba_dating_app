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
                  //cancel button
                  MaterialButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    color: kSubColor,
                    textColor: kPrimaryColor,
                    child: Icon(Icons.close_rounded, size: 24),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  //refresh button
                  MaterialButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    color: Colors.grey.shade100,
                    textColor: Colors.green.shade500,
                    child: Icon(Icons.refresh_rounded, size: 24),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  //check button
                  MaterialButton(
                    onPressed: () {},
                    color: kPrimaryColor,
                    textColor: kSubColor,
                    child: Icon(Icons.check_rounded, size: 24),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
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

//card's images string
List<String> images = [
  'https://media1.popsugar-assets.com/files/thumbor/d4kZB_JE3YdxtnPyVOjJF64ggeo/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2017/11/30/800/n/1922398/169fe2249b4b40fe_GettyImages-468038186/i/Freddie-Highmore-Facts.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/8/89/Chris_Evans_2020_%28cropped%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sebastian_Stan_by_Gage_Skidmore_2_%28cropped%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg',
  'https://m.media-amazon.com/images/M/MV5BMjE2MjI2OTk1OV5BMl5BanBnXkFtZTgwNTY1NzM4MDI@._V1_.jpg',
  'https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/7/27/photo-1-1627385343987657351288.jpg',
  'https://cdns-images.dzcdn.net/images/artist/3b99aa38bc4f58b05d6671c918eeb03e/500x500.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/3/3c/191125_Selena_Gomez_at_the_2019_American_Music_Awards.png',
];

//name string
List<String> name = [
  'Freddie Highmore',
  'Chris Evans',
  'Sebastian Stan',
  'Tom Holland',
  'Andrew Garfield',
  'Taylor Swift',
  'Ariana Grande',
  'Selena Gomez',
];

//age string
List<String> age = [
  '20',
  '20',
  '20',
  '20',
  '20',
  '20',
  '20',
  '20',
];

//cards
List<Widget> cards = List.generate(
  images.length,
  (int index) {
    return Container(
      //card decoration
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
      //everything inside the card
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //image display here
              Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //name display here
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 1.0, 0.0, 0.0),
                      child: Text(name[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    //age display here
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 10.0),
                      child: Text(age[index],
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20.0,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.white38,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  },
);
