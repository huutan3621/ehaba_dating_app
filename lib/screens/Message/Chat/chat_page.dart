import 'package:ehaba_dating_app/constraint.dart';
import 'package:ehaba_dating_app/screens/Message/data.dart';
import 'package:flutter/material.dart';


class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _sendMessageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: kSubColor,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            )),
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/tan01.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(
              width: 15,
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tân Võ",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Online",
                  style: TextStyle(color: kPrimaryColor, fontSize: 14),
                )
              ],
            )
          ],
        ),

        actions: <Widget>[
          Icon(
            Icons.phone,
            color: kPrimaryColor,
            size: 32,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),

      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  //Thanh bottom
  Widget getBottom(){
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSubColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            //Photo
            Row(
                children: <Widget>[
                  Icon(Icons.photo,size: 35,color: kPrimaryColor,),
                  SizedBox(width: 15,),
                ],
              ),

            //Keyboard
            Container(
              width: (MediaQuery.of(context).size.width - 100),
              child: Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 150),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: _sendMessageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tin nhắn",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Icon(Icons.favorite,size: 35,color: kPrimaryColor,),
              ],
            ),
            ), 
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    
    return ListView(
      padding: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 80),
      children: List.generate(messages.length, (index){
        return ChatBubble(isMe: messages[index]['isMe'],messageType: messages[index]['messageType'],message: messages[index]['message']);
      }),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String profileImg;
  final String message;
  final int messageType;
  const ChatBubble({
    Key key, this.isMe, this.profileImg, this.message, this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMe){
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: getMessageType(messageType) 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }else{
      return Padding(
        padding:  EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: getMessageType(messageType) 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    
  }
  getMessageType(messageType){
    if(isMe){
      // start message
      if(messageType == 1){
        return BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30)
        );
      }
      // middle message
      else if(messageType == 2){
        return BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30)
        );
      }
      // end message
      else if(messageType == 3){
        return BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30)
        );
      }
      // standalone message
      else{
        return BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else{
      // start message
        if(messageType == 1){
          return BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
          );
        }
        // middle message
        else if(messageType == 2){
          return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
          );
        }
        // end message
        else if(messageType == 3){
          return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
          );
        }
        // standalone message
        else{
          return BorderRadius.all(Radius.circular(30));
        }
    }
  }
}
