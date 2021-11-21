import 'package:chips_choice/chips_choice.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';

class WrappedMultipleChip extends StatefulWidget {
  @override
  _WrappedMultipleChipState createState() => _WrappedMultipleChipState();
}

class _WrappedMultipleChipState extends State<WrappedMultipleChip> {
  List<String> tags = [];
  List<String> options = [
    'Tin tức',
    'Giải trí',
    'Chơi game',
    'Nghe nhạc',
    'Xem phim',
    'Chụp ảnh',
    'Chính trị',
    'Viết lách',
    'Công nghệ',
    'Thể thao',
    'Giáo dục',
    'Thời trang',
    'Mua sắm',
    'Du Lịch',
    'Nuôi thú cưng',
    'Đọc sách',
    'Khoa học',
    'Thiên văn học',
    'Lịch sử',
    'Mỹ thuật',
    'Trang trí',
    'Vẽ tranh',
    'Pha chế',
    'Trồng cây',
    'May vá',
    'Làm đẹp',
    'Tập gym',
    'Học ngôn ngữ',
    'Karaoke',
    'Cắm trại',
    'Trò chuyện',
    'Ăn uống',
  ];

  //how chips interact on the screen
  @override
  Widget build(BuildContext context) {
    return ChipsChoice.multiple(
      value: tags,
      onChanged: (val) => setState(() => tags = val as List<String>),
      choiceItems: C2Choice.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      //chip decoration
      wrapped: true,
      choiceStyle: C2ChoiceStyle(
        color: Colors.grey,
        brightness: Brightness.dark,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      choiceActiveStyle: C2ChoiceStyle(
        color: kPrimaryColor,
      ),
    );
  }
}
