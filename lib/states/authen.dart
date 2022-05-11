import 'package:flutter/material.dart';
import 'package:narong_transport/states/create_account.dart';
import 'package:narong_transport/states/register.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/widgets/showbutton.dart';
import 'package:narong_transport/widgets/showform.dart';
import 'package:narong_transport/widgets/showimage.dart';
import 'package:narong_transport/widgets/showtext.dart';
import 'package:narong_transport/widgets/showtextbutton.dart';

class Authen extends StatelessWidget {
  const Authen({
    Key? key,
  }) : super(key: key);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLeftSide(newLogo(constraints)),
                  newLeftSide(newText()),
                  newEmail(),
                  newPassword(),
                  newButton(),
                  newCreateAccount(context: context),
                ],
              ),
            ),
          ),
        );
      }),
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
      pressFunc: () {},
    );
  }

  ShowForm newPassword() {
    return ShowForm(
      label: 'Password :',
      iconData: Icons.lock_outline_rounded,
      obsecu: true,
      changeFunc: (String string) {},
    );
  }

  ShowForm newEmail() {
    return ShowForm(
      label: 'Email :',
      iconData: Icons.contact_mail_outlined,
      changeFunc: (String string) {},
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
}
