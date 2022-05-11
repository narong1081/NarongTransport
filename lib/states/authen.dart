import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narong_transport/models/authen_model.dart';
import 'package:narong_transport/models/response_false_model.dart';
import 'package:narong_transport/states/create_account.dart';
import 'package:narong_transport/states/register.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/utilities/my_dialog.dart';
import 'package:narong_transport/widgets/showbutton.dart';
import 'package:narong_transport/widgets/showform.dart';
import 'package:narong_transport/widgets/showimage.dart';
import 'package:narong_transport/widgets/showtext.dart';
import 'package:narong_transport/widgets/showtextbutton.dart';

class Authen extends StatefulWidget {
  const Authen({
    Key? key,
  }) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? rollerid, username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: Container(
            decoration: MyConstant().imageBox(),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    newLeftSide(newLogo(constraints)),
                    newLeftSide(newText()),
                    newRollerID(),
                    newUsername(),
                    newPassword(),
                    newButton(),
                    newCreateAccount(context: context),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  ShowForm newRollerID() {
    return ShowForm(
      label: 'Roller ID :',
      iconData: Icons.account_box_outlined,
      textInputType: TextInputType.number,
      changeFunc: (String string) {
        rollerid = string.trim();
      },
    );
  }

  Row newLeftSide(Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: widget,
        ),
      ],
    );
  }

  Row newCreateAccount({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ShowText(label: 'Non Account?'),
        ShowTextButton(
          label: 'Create Account',
          pressFunc: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Register(),
                ));
          },
        ),
      ],
    );
  }

  ShowButton newButton() {
    return ShowButton(
      label: 'Login',
      pressFunc: () {
        if ((rollerid?.isEmpty ?? true) ||
            (username?.isEmpty ?? true) ||
            (password?.isEmpty ?? true)) {
          MyDialog(context: context).normalDialog(
              title: 'Your login info is wrong!',
              subTitle: 'Please enter your info.');
        } else {
          processCheckAuthen();
        }
      },
    );
  }

  ShowForm newPassword() {
    return ShowForm(
      label: 'Password :',
      iconData: Icons.lock_outline_rounded,
      obsecu: true,
      changeFunc: (String string) {
        password = string.trim();
      },
    );
  }

  ShowForm newUsername() {
    return ShowForm(
      label: 'Username :',
      iconData: Icons.account_circle_outlined,
      textInputType: TextInputType.number,
      changeFunc: (String string) {
        username = string.trim();
      },
    );
  }

  Widget newText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowText(
          label: 'Login',
          textStyle: MyConstant().h1Style(),
        ),
      ],
    );
  }

  Widget newLogo(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: const ShowImage(),
          width: constraints.maxWidth * 0.4,
        ),
      ],
    );
  }

  Future<void> processCheckAuthen() async {
    AuthenModel authenModel = AuthenModel(
      rollerid: rollerid!,
      username: username!,
      password: password!,
    );

    await Dio()
        .post(
      MyConstant.pathAuthen,
      data: authenModel.toMap(),
    )
        .then((value) {
      print('Connect api success! values ==> $value');
      ResponseFalseModel responseFalseModel =
          ResponseFalseModel.fromMap(value.data);
      if (responseFalseModel.ResponseStatus == 'Failed') {
        MyDialog(context: context).normalDialog(
          title: 'Cannot login!',
          subTitle: responseFalseModel.ResponseMessages,
        );
      } else {
        print('Login success!');
      }
    }).catchError((onError) {
      print('Connect api error!');
    });
  }
}
