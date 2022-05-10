// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:narong_transport/utilities/my_constant.dart';
import 'package:narong_transport/widgets/showtext.dart';

class ShowForm extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool? obsecu;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    required this.label,
    required this.iconData,
    this.obsecu,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        onChanged: changeFunc,
        obscureText: obsecu ?? false,
        style: MyConstant().h3Style(),
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.9),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          suffixIcon: Icon(
            iconData,
            color: MyConstant.dark,
          ),
          label: ShowText(label: label),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.primary),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
