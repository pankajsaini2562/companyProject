import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle headlineTextStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontFamily: 'Poopins1',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle lightTextStyle(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontFamily: 'Poopins1',
    );
  }
}
