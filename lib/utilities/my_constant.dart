import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = Color.fromARGB(255, 243, 98, 98);
  static Color dark = Color.fromARGB(255, 33, 66, 171);
  static Color light = Color.fromARGB(255, 214, 243, 206);
  static Color myDarkNavyBlue = Color.fromARGB(255, 58, 106, 138);
  static Color myNavyBlue = Color.fromARGB(255, 121, 174, 220);
  static Color myGreen = Color.fromARGB(255, 188, 230, 222);
  static Color myPink = Color.fromARGB(255, 252, 131, 131);

  static List<String> typeUsers = [
    'Owner',
    'Customer',
    'Driver',
  ];

  //method
  BoxDecoration curveBorderBox() => BoxDecoration(
        border: Border.all(
          color: MyConstant.dark,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  BoxDecoration planbox() => BoxDecoration(color: light.withOpacity(0.5));
  BoxDecoration imageBox() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      );

  TextStyle h1Style() {
    return TextStyle(
      color: myDarkNavyBlue,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      color: myNavyBlue,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      color: myNavyBlue,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3Active() {
    return  TextStyle(
      color: myPink,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}
