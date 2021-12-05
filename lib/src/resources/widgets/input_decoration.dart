import 'package:flutter/material.dart';
import '../../constants.dart';

InputDecoration buildInputDecoration(String label, String? error){
  return InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.black26,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.0),
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    errorText: error,
    errorStyle: TextStyle(color: Colors.black26, fontSize: 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.5,
      )
    ),
    labelText: label,
    labelStyle: TextStyle(color: kPrimaryColor),
  );
}