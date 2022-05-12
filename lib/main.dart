// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narong_transport/models/authen_model.dart';
import 'package:narong_transport/models/success_authen_model.dart';
import 'package:narong_transport/states/authen.dart';
import 'package:narong_transport/states/my_service.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (context) => const Authen(),
  '/myService': (context) => const MyService(),
};
String? firstState;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString(MyConstant.keyToken);
  print('## token at main ==> $token');

  if (token?.isEmpty ?? true) {
    firstState = '/authen';
    runApp(const MyApp());
  } else {
    AuthenModel authenModel = AuthenModel(
      rollerid: preferences.getString(MyConstant.keyRollerId)!,
      username: preferences.getString(MyConstant.keyUsername)!,
      password: preferences.getString(MyConstant.keyPassword)!,
    );
    await Dio()
        .post(MyConstant.pathAuthen, data: authenModel.toMap())
        .then((value) async {
      SuccessAuthenModel successAuthenModel =
          SuccessAuthenModel.fromJson(value.data);
      String newToken = successAuthenModel.responseData![0].token.toString();
      print('new token ==> $newToken');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(MyConstant.keyToken, newToken).then((value) {
        firstState = '/myService';
      });
    });

    firstState = '/myService';
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState ?? '/authen',
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
