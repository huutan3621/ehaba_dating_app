import 'package:flutter/material.dart';

double getScreenPropotionHeight(double actualWeight, Size size) {
  return (actualWeight / 812.0) * size.height;
}

//May cai nay de chia ti le lay size man hinh
double getScreenPropotionWitdh(double actualWitdh, Size size) {
  return (actualWitdh / 375.0) * size.width;
}
