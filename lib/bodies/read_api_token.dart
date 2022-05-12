// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narong_transport/models/profile_model.dart';
import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/widgets/showtext.dart';

class ReadApiToken extends StatefulWidget {
  final String token;

  const ReadApiToken({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<ReadApiToken> createState() => _ReadApiTokenState();
}

class _ReadApiTokenState extends State<ReadApiToken> {
  String? token;
  ProfileModel? profileModel;
  bool load = true;

  @override
  void initState() {
    super.initState();
    token = widget.token;
    readProfile();
  }

  Future<void> readProfile() async {
    Dio dio = Dio();
    dio.options.headers['Context-Type'] = 'applicaion/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> map = {};
    map['id'] = '105';
    map['role'] = 'Roller';

    await dio.post(MyConstant.pathGetProfile, data: map).then((value) {
      // print('### value from token ==> $value');
      profileModel = ProfileModel.fromJson(value.data);

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? Center(child: CircularProgressIndicator())
          : Column(
            children: [
              ShowText(label: 'Name : ${profileModel!.responseData!.fullname}'),
              ShowText(label: 'Member Type : ${profileModel!.responseData!.membertypename}'),
            ],
          ),
    );
  }
}
