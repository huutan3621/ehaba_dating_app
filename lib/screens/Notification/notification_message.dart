import 'package:ehaba_dating_app/model/use_model.dart';

class Message {
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> notifications = [
  Message(
    sender: hoangDung,
    time: '1 phút',
    text: 'đã gửi một tin nhắn cho bạn',
    unread: true,
  ),
  Message(
    sender: hoangDung,
    time: '3 phút',
    text: 'và bạn đã kết nối với nhau',
    unread: true,
  ),
  Message(
    sender: andrewGarfield,
    time: '30 phút',
    text: 'rời khỏi cuộc trò chuyện',
    unread: true,
  ),
  Message(
    sender: andrewGarfield,
    time: '55 phút',
    text: 'và bạn đã kết nối với nhau',
    unread: false,
  ),
  Message(
    sender: andrewGarfield,
    time: '13 giờ',
    text: 'muốn quay lại với bạn',
    unread: false,
  ),
  Message(
    sender: chrisEvans,
    time: '1 ngày',
    text: 'muốn quay lại với bạn',
    unread: false,
  ),
  Message(
    sender: manNguyen,
    time: '3 ngày',
    text: 'và bạn đã kết nối với nhai',
    unread: false,
  ),
  Message(
    sender: quanAP,
    time: '6 ngày',
    text: 'đã rời khỏi cuộc trò chuyện',
    unread: false,
  ),
  Message(
    sender: quanAP,
    time: '7 ngày',
    text: 'và bạn đã kết nối với nhau',
    unread: false,
  ),
];

