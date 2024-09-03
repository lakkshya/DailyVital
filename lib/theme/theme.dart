import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.blueAccent,
    selectionColor: Colors.blueAccent.withOpacity(0.3),
    selectionHandleColor: Colors.blueAccent,
  ),
  focusColor: Colors.blueAccent,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF616161), width: 1.0),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFC62828), width: 2.0),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFC62828), width: 2.0),
    ),
    labelStyle: TextStyle(color: Colors.grey[700]),
    floatingLabelStyle: TextStyle(color: Colors.grey[700]),
  ),
);
