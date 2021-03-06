import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = Color.fromARGB(255, 243, 98, 98);
  static Color dark = Color.fromARGB(255, 33, 66, 171);
  static Color light = Color.fromARGB(255, 214, 243, 206);
  static Color myDarkNavyBlue = Color.fromARGB(255, 58, 106, 138);
  static Color myNavyBlue = Color.fromARGB(255, 121, 174, 220);
  static Color myGreen = Color.fromARGB(255, 193, 248, 216);
  static Color myPink = Color.fromARGB(255, 252, 131, 131);

  static String keyRollerId = 'rollerid';
  static String keyUsername = 'username';
  static String keyPassword = 'password';
  static String keyToken = 'token';

  static List<String> typeUsers = [
    'Owner',
    'Customer',
    'Driver',
  ];

  static String pathRegister =
      'https://www.rollerglobal.com/api/api/Member/register';
  static String pathAuthen =
      'https://www.rollerglobal.com/api/api/Member/login';
  static String pathGetProfile =
      'https://www.rollerglobal.com/api/api/Member/getprofile';

  //method
  BoxDecoration curveBorderBox() => BoxDecoration(
        border: Border.all(
          color: MyConstant.dark,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  BoxDecoration planbox() => BoxDecoration(color: myGreen.withOpacity(0.3));
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
    return TextStyle(
      color: myPink,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}
