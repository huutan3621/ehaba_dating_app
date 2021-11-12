import 'package:flutter/material.dart';
import 'package:ehaba_dating_app/constraint.dart';

InputDecoration buildInputDecoration(String label){
  return InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.black26,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.0),
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    errorStyle: TextStyle(color: Colors.black26, fontSize: 13),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      )
    ),
    labelText: label,
    labelStyle: TextStyle(color: kPrimaryColor),
  );
}