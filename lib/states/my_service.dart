// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:narong_transport/bodies/get_location.dart';
import 'package:narong_transport/bodies/read_api_token.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/utilities/my_dialog.dart';
import 'package:narong_transport/widgets/showlisttile.dart';
import 'package:narong_transport/widgets/showtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String? token;
  var widgets = <Widget>[];
  int indexWidget = 0;
  bool load = true;

  @override
  void initState() {
    super.initState();
    findToken();
  }

  Future<void> findToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString(MyConstant.keyToken);
    // print('token to user ==> $token');
    widgets.add(ReadApiToken(
      token: token!,
    ));
    widgets.add(const GetLocationShowMap());
    load = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          label: 'My Service',
          textStyle: MyConstant().h2Style(),
        ),
        elevation: 0,
        foregroundColor: MyConstant.dark,
        backgroundColor: MyConstant.myGreen.withOpacity(0.3),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexWidget = 0;
                    });
                  },
                  child: const ShowListTile(
                    title: 'Read API',
                    subTitle: 'Read API by Token',
                    path: 'images/api.png',
                    size: 36,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexWidget = 1;
                    });
                  },
                  child: const ShowListTile(
                    title: 'Get Location',
                    subTitle: 'Get Location by Token',
                    path: 'images/pin.png',
                    size: 36,
                  ),
                ),
              ],
            ),
            newSignOut(context: context),
          ],
        ),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : widgets[indexWidget],
    );
  }

  Column newSignOut({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            MyDialog(context: context).twoWayDialog(
              title: 'Confirm Sign out',
              subTitle: 'Are you sure?',
              label1: 'SignOut',
              label2: 'Cancel',
              pressFunc1: () {
                processSignOut(context: context);
              },
              pressFunc2: () {
                Navigator.pop(context);
              },
            );
          },
          child: const ShowListTile(
            title: 'Sign Out',
            subTitle: 'Sign Out and Move To Authen',
            path: 'images/signout.png',
            size: 40,
          ),
        ),
      ],
    );
  }

  Future<void> processSignOut({required BuildContext context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear().then((value) {
      Navigator.pushNamedAndRemoveUntil(context, '/authen', (route) => false);
    });
  }
}
