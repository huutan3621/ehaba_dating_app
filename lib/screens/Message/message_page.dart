import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/Message/data.dart';
import 'package:ehaba_dating_app/screens/profile_details_page.dart';
import 'package:flutter/material.dart';

import 'Chat/chat_page.dart';


class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _searchController = new TextEditingController();
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
              'Tin nhắn',
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
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.black26,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: IconButton(
              icon: Icon(Icons.sort_rounded),
              color: kPrimaryColor,
              onPressed: () {},
            ),
            ),
          ) 
        ]
      ),

      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //buildSearch(query),
              Column(
                children: List.generate(userMessages.length, (index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7,),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 75,
                            height: 75,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/avata.png'),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            padding: EdgeInsets.only(left: 20,),
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
                                        userMessages[index]['name'],
                                        style: TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    userMessages[index]['created_at'],
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black54,
                                    )
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              userMessages[index]['unread']
                                ? Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(                  
                                    userMessages[index]['message'],
                                    style: TextStyle(
                                      fontSize: 15, color: kPrimaryColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                                : Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(                  
                                    userMessages[index]['message'],
                                    style: TextStyle(
                                      fontSize: 15, color: Colors.black.withOpacity(0.8)
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                          )
                        ],
                      )
                    )
                  );
                }),
              )
            ]
          )
        ]
      )
    );
  }

  // Widget getBody() {
  //   return SafeArea(
  //       child: ListView(
  //     padding: EdgeInsets.only(left: 20, right: 20, top: 15),
  //     children: <Widget>[
  //       Column(
  //         children: List.generate(userMessages.length, (index) {
  //           return InkWell(
  //             onTap: (){
  //               Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage()));
  //             },
  //                         child: Padding(
  //               padding: const EdgeInsets.only(bottom: 20),
  //               child: Row(
  //                 children: <Widget>[
                    // Container(
                    //   width: 75,
                    //   height: 75,
                    //   child: Stack(
                    //     children: <Widget>[
                      
                              
                    //           Container(
                    //               width: 70,
                    //               height: 70,
                    //               decoration: BoxDecoration(
                    //                   shape: BoxShape.circle,
                    //                   image: DecorationImage(
                    //                       image:
                    //                           NetworkImage(userMessages[index]['img']),
                    //                       fit: BoxFit.cover)),
                    //             ),
                          
                    //     ],
                    //   ),
                    // ),
  //                   SizedBox(
  //                     width: 20,
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Text(
  //                         userMessages[index]['name'],
  //                         style: TextStyle(
  //                             fontSize: 17, fontWeight: FontWeight.w500),
  //                       ),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       SizedBox(
  //                         width: MediaQuery.of(context).size.width - 135,
  //                                               child: Text(
                                                  
  //                           userMessages[index]['message'] +" - "+userMessages[index]['created_at'],
  //                           style: TextStyle(
  //                               fontSize: 15, color: Colors.black.withOpacity(0.8)
  //                               ),
  //                               overflow: TextOverflow.ellipsis,
  //                         ),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         }),
  //       )
  //     ],
  //   ));
  // }
}
