import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = Color.fromARGB(255, 243, 98, 98);
  static Color dark = Color.fromARGB(255, 33, 66, 171);
  static Color light = Color.fromARGB(255, 204, 244, 193);

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
