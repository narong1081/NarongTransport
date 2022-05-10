// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/widgets/showlisttile.dart';
import 'package:narong_transport/widgets/showtextbutton.dart';

class MyDialog {
  final BuildContext context;

  MyDialog({
    required this.context,
  });

  Future<void> twoWayDialog({
    required String title,
    required String subTitle,
    required String label1,
    required String label2,
    required Function() pressFunc1,
    required Function() pressFunc2,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: MyConstant.myGreen,
        title: ShowListTile(
          title: title,
          subTitle: subTitle,
          path: 'images/avatar.png',
        ),
        actions: [
          ShowTextButton(
            label: label1,
            pressFunc: pressFunc1,
          ),
          ShowTextButton(
            label: label2,
            pressFunc: pressFunc2,
          ),
          ShowTextButton(
            label: 'Cancel',
            pressFunc: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> normalDialog({
    required String title,
    required String subTitle,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: MyConstant.myGreen,
        title: ShowListTile(
          title: title,
          subTitle: subTitle,
          path: 'images/avatar.png',
        ),
        actions: [
          ShowTextButton(
            label: 'OK',
            pressFunc: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
