import 'dart:io';

import 'package:ehaba/bloc/messaging/bloc.dart';
import 'package:ehaba/bloc/messaging/messaging_bloc.dart';
import 'package:ehaba/models/message.dart';
import 'package:ehaba/models/user.dart';
import 'package:ehaba/repositories/messaging.dart';
import 'package:ehaba/ui/constants.dart';
import 'package:ehaba/ui/widgets/constraint.dart';
import 'package:ehaba/ui/widgets/message.dart';
import 'package:ehaba/ui/widgets/photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messaging extends StatefulWidget {
  final User currentUser, selectedUser;

  const Messaging({this.currentUser, this.selectedUser});

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  TextEditingController _messageTextController = TextEditingController();
  MessagingRepository _messagingRepository = MessagingRepository();
  MessagingBloc _messagingBloc;
  bool isValid = false;

//  bool get isPopulated => _messageTextController.text.isNotEmpty;
//
//  bool isSubmitButtonEnabled(MessagingState state) {
//    return isPopulated;
//  }

  @override
  void initState() {
    super.initState();
    _messagingBloc = MessagingBloc(messagingRepository: _messagingRepository);

    _messageTextController.text = '';
    _messageTextController.addListener(() {
      setState(() {
        isValid = (_messageTextController.text.isEmpty) ? false : true;
      });
    });
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }

  void _onFormSubmitted() {
    print("Message Submitted");

    _messagingBloc.add(
      SendMessageEvent(
        message: Message(
          text: _messageTextController.text,
          senderId: widget.currentUser.uid,
          senderName: widget.currentUser.name,
          selectedUserId: widget.selectedUser.uid,
          photo: null,
        ),
      ),
    );
    _messageTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: size.height * 0.02,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipOval(
              child: Container(
                height: size.height * 0.06,
                width: size.height * 0.06,
                child: PhotoWidget(
                  photoLink: widget.selectedUser.photo,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Expanded(
              child: Text(widget.selectedUser.name),
            ),
          ],
        ),
      ),
      body: BlocBuilder<MessagingBloc, MessagingState>(
        bloc: _messagingBloc,
        builder: (BuildContext context, MessagingState state) {
          if (state is MessagingInitialState) {
            _messagingBloc.add(
              MessageStreamEvent(
                  currentUserId: widget.currentUser.uid,
                  selectedUserId: widget.selectedUser.uid),
            );
          }
          if (state is MessagingLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MessagingLoadedState) {
            Stream<QuerySnapshot> messageStream = state.messageStream;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                  stream: messageStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text(
                        "Bắt đầu cuộc trò chuyện?",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      );
                    }
                    if (snapshot.data.docs.isNotEmpty) {
                      return Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return MessageWidget(
                                    currentUserId: widget.currentUser.uid,
                                    messageId: snapshot.data.docs[index].id,
                                  );
                                },
                                itemCount: snapshot.data.docs.length,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Bắt đầu cuộc trò chuyện ?",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  },
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.06,
                  color: kSubColor,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          File photo;
                          FilePickerResult getPhoto = await FilePicker.platform
                              .pickFiles(type: FileType.image);
                          if (getPhoto != null) {
                            setState(() {
                              photo = File(getPhoto.files.first.path);
                            });
                            _messagingBloc.add(
                              SendMessageEvent(
                                message: Message(
                                    text: null,
                                    senderName: widget.currentUser.name,
                                    senderId: widget.currentUser.uid,
                                    photo: photo,
                                    selectedUserId: widget.selectedUser.uid),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.005),
                          child: Icon(
                            Icons.photo_library,
                            color: kPrimaryColor,
                            size: size.height * 0.04,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: size.height * 0.05,
                          padding: EdgeInsets.all(size.height * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(size.height * 0.04),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _messageTextController,
                              textInputAction: TextInputAction.send,
                              maxLines: null,
                              decoration: null,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: backgroundColour,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: isValid ? _onFormSubmitted : null,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.01),
                          child: Icon(
                            Icons.send,
                            size: size.height * 0.04,
                            color: isValid ? kPrimaryColor : kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
