// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:narong_transport/utilities/my_constant.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() pressFunc;
  final double? size;
  const ShowIconButton({
    Key? key,
    required this.iconData,
    required this.pressFunc,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressFunc,
      icon: Icon(
        iconData,
        color: MyConstant.dark,
        size: size ?? 24,
      ),
    );
  }
}
