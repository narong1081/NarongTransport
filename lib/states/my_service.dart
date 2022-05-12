import 'package:flutter/material.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/utilities/my_dialog.dart';
import 'package:narong_transport/widgets/showlisttile.dart';
import 'package:narong_transport/widgets/showtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatelessWidget {
  const MyService({Key? key}) : super(key: key);

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
        child: newSignOut(context: context),
      ),
      body: const ShowText(label: 'This is my service'),
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
