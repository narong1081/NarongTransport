import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/utilities/my_dialog.dart';
import 'package:narong_transport/widgets/showbutton.dart';
import 'package:narong_transport/widgets/showform.dart';
import 'package:narong_transport/widgets/showiconbutton.dart';
import 'package:narong_transport/widgets/showimage.dart';
import 'package:narong_transport/widgets/showtext.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var typeUsers = MyConstant.typeUsers;
  String? typeUser;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ShowText(
          label: 'Create New Account',
          textStyle: MyConstant().h2Style(),
        ),
        elevation: 0,
        foregroundColor: MyConstant.dark,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          newCenter(
            widget: newAvatar(),
          ),
          newCenter(
            widget: ShowForm(
              label: 'Name :',
              iconData: Icons.person_outline,
              changeFunc: (String string) {},
            ),
          ),
          newCenter(widget: newTypeUser()),
          newCenter(
            widget: ShowForm(
              label: 'Email :',
              iconData: Icons.email_outlined,
              changeFunc: (String string) {},
            ),
          ),
          newCenter(
            widget: ShowForm(
              obsecu: true,
              label: 'Password :',
              iconData: Icons.lock_outline_rounded,
              changeFunc: (String string) {},
            ),
          ),
          newCenter(
            widget: ShowForm(
              obsecu: true,
              label: 'Re-Password :',
              iconData: Icons.lock_rounded,
              changeFunc: (String sring) {},
            ),
          ),
          newCenter(
            widget: ShowButton(
              label: 'Create New Account',
              pressFunc: () {
                if (file == null) {
                  MyDialog(context: context).normalDialog(
                    title: 'Non Avatar!',
                    subTitle: 'Please take avatar',
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget newTypeUser() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      margin: const EdgeInsets.only(
        top: 15,
      ),
      decoration: MyConstant().curveBorderBox(),
      width: 250,
      height: 45,
      child: DropdownButton(
        hint: const ShowText(label: 'Please choose type user'),
        value: typeUser,
        items: typeUsers
            .map(
              (e) => DropdownMenuItem(
                child: ShowText(label: e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            typeUser = value.toString();
          });
        },
      ),
    );
  }

  Widget newAvatar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 16,
      ),
      width: 250,
      height: 250,
      child: Stack(
        children: [
          file == null
              ? const ShowImage(
                  path: 'images/avatar.png',
                )
              : CircleAvatar(
                  radius: 200,
                  backgroundImage: FileImage(file!),
                ),
          Positioned(
            right: 55,
            bottom: 2,
            child: ShowIconButton(
              iconData: Icons.add_a_photo,
              pressFunc: () {
                MyDialog(context: context).twoWayDialog(
                  title: 'Choose avatar?',
                  subTitle: 'Please tab Camera or Gallery',
                  label1: 'Camera',
                  pressFunc1: () {
                    Navigator.pop(context);
                    processTakePhoto(
                      source: ImageSource.camera,
                    );
                  },
                  label2: 'Gallery',
                  pressFunc2: () {
                    Navigator.pop(context);
                    processTakePhoto(
                      source: ImageSource.gallery,
                    );
                  },
                );
              },
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> processTakePhoto({required ImageSource source}) async {
    var result = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (result != null) {
      file = File(result.path);
      setState(() {});
    }
  }

  Row newCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }
}
