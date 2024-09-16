import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.teal,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xFF008F77),
    selectionColor: const Color(0xFF008F77).withOpacity(0.3),
    selectionHandleColor: const Color(0xFF008F77),
  ),
  focusColor: const Color(0xFF008F77),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFF008F77), width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFF616161), width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFFC62828), width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Color(0xFFC62828), width: 2.0),
    ),
    labelStyle: TextStyle(color: Colors.grey[700]),
    floatingLabelStyle: TextStyle(color: Colors.grey[700]),
    contentPadding: const EdgeInsets.all(12.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: const Color(0xFF003B36),
      foregroundColor: Colors.white, 
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Colors.white,
    headerBackgroundColor: const Color(0xFF003B36),
    headerForegroundColor: Colors.white,
    dayForegroundColor: const WidgetStatePropertyAll(Colors.black),
    yearForegroundColor: const WidgetStatePropertyAll(Colors.black),
    todayForegroundColor: const WidgetStatePropertyAll(Color(0xFF008F77)),
    todayBackgroundColor: WidgetStatePropertyAll(const Color(0xFF008F77).withOpacity(0.2)),
    dividerColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    weekdayStyle: const TextStyle(
      color: Colors.black,
    ),
    yearStyle: const TextStyle(
      color: Color(0xFF003B36),
    ),
    dayStyle: const TextStyle(
      color: Colors.black,
    ),
  ),
);
