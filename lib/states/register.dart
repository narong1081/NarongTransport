// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:narong_transport/models/response_false_model.dart';
import 'package:narong_transport/models/user_model.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/utilities/my_dialog.dart';
import 'package:narong_transport/widgets/show_form_phone.dart';
import 'package:narong_transport/widgets/showbutton.dart';
import 'package:narong_transport/widgets/showimage.dart';
import 'package:narong_transport/widgets/showtext.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? yearRegis, phoneNumber;
  String genType = 'M', inFriendId = '';

  @override
  void initState() {
    super.initState();
    findYear();
  }

  void findYear() {
    DateTime dateTime = DateTime.now();
    int year = dateTime.year + 543;
    yearRegis = year.toString();
    print('yearRegis : $yearRegis');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          label: 'สมัครสมาชิก ผ่าน Server',
          textStyle: MyConstant().h2Style(),
        ),
        elevation: 0,
        foregroundColor: MyConstant.dark,
        backgroundColor: MyConstant.myGreen.withOpacity(0.3),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        child: Container(
          decoration: MyConstant().planbox(),
          child: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.75,
                      child: const ShowImage(
                        path: 'images/register.png',
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ShowText(
                        label: 'Year : $yearRegis',
                        textStyle: MyConstant().h3Style(),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ShowText(
                        label: 'GenType : $genType',
                        textStyle: MyConstant().h3Style(),
                      ),
                    ),
                    ShowFormPhone(
                      label: 'Phone :',
                      iconData: Icons.phone_android_rounded,
                      changeFunc: (String string) {
                        phoneNumber = string.trim();
                      },
                    ),
                    ShowButton(
                      label: 'Register',
                      pressFunc: () {
                        if (phoneNumber?.isEmpty ?? true) {
                          MyDialog(context: context).normalDialog(
                            title: 'Phone number is empty.',
                            subTitle: 'Please enter your phone number!',
                          );
                        } else if (phoneNumber!.length != 10) {
                          MyDialog(context: context).normalDialog(
                            title: 'Phone number is incorrect!',
                            subTitle: 'Please check your phone number',
                          );
                        } else {
                          processRegister();
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> processRegister() async {
    print('Phone number : $phoneNumber');
    UserModel userModel = UserModel(
        year: yearRegis!,
        gentype: genType,
        phonenumber: phoneNumber!,
        infriendid: inFriendId);

    Map<String, dynamic> map = userModel.toMap();
    print('map : $map');

    await Dio()
        .post(
      MyConstant.pathRegister,
      data: map,
    )
        .then((value) {
      print('Success Register value : $value');
      //get value from API response
      ResponseFalseModel responseFalseModel =
          ResponseFalseModel.fromMap(value.data);
      print('responseFalseModel : ${responseFalseModel.toMap()}');

      if (responseFalseModel.ResponseStatus == 'Failed') {
        MyDialog(context: context).normalDialog(
          title: 'Cannot register!',
          subTitle: responseFalseModel.ResponseMessages,
        );
      } else {}
    }).catchError((onError) {
      print('onError ==> ${onError.toString()}');
    });
  }
}
