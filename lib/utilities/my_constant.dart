import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = Color.fromARGB(255, 90, 126, 245);
  static Color dark = Color.fromARGB(255, 44, 80, 202);
  static Color light = Color.fromARGB(255, 204, 244, 193);

  //method
  BoxDecoration planbox() => BoxDecoration(color: light.withOpacity(0.5));

  TextStyle h1Style() {
    return TextStyle(
      color: dark,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      color: dark,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      color: dark,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3Active() {
    return const TextStyle(
      color: Colors.pink,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}
