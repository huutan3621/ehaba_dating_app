import 'package:chips_choice/chips_choice.dart';
import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';

class WrappedMultipleChipB extends StatefulWidget {
  @override
  _WrappedMultipleChipStateB createState() => _WrappedMultipleChipStateB();
}

class _WrappedMultipleChipStateB extends State<WrappedMultipleChipB> {
  List<String> tags = [];
  List<String> options = [
    'Sinh viên',
    'Học sinh',
    'Phục vụ',
    'Pha chế',
    'Đầu bếp',
    'Họa sĩ',
    'Ca sĩ',
    'Tác giả',
    'Lập trình viên',
    'Nhà thiết kế',
    'Giáo viên',
    'Chuyên viên trang điểm',
    'Bán hàng',
    'Hướng dẫn viên',
    'Bác sĩ',
    'Y tá',
    'Bảo vệ',
    'Youtuber',
    'Blogger',
    'Công nhân',
    'Giảng viên',
    'Ca sĩ',
    'Chuyên viên tâm lý',
    'Tài xế',
    'Thợ may',
    'Làm tự do',
    'Kinh doanh tại nhà',
    'Phiên dịch',
    'Tiếp tân',
    'Vận động viên',
    'Quay phim',
    'Đạo diễn',
  ];

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
