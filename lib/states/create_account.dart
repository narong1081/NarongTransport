import 'package:flutter/material.dart';
import 'package:narong_transport/utilities/my_constant.dart';
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
              pressFunc: () {},
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
          const ShowImage(
            path: 'images/avatar.png',
          ),
          Positioned(
            right: 55,
            bottom: 2,
            child: ShowIconButton(
              iconData: Icons.add_a_photo,
              pressFunc: () {},
              size: 40,
            ),
          ),
        ],
      ),
    );
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
