import 'package:flutter/material.dart';
import 'package:ehaba/ui/widgets/constraint.dart';

Widget genderWidget(icon, text, size, selected, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: size.height * 0.12,
          color: selected == text ? kPrimaryColor : Colors.blueGrey,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            color: selected == text ? kPrimaryColor : Colors.blueGrey,
          ),
        )
      ],
    ),
  );
}
