import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

import '../theme_manager/color_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelName;
  final String hintText;
  bool isObsecure;
  final TextEditingController controller;

  CustomTextFieldWidget({
    Key? key,
    required this.labelName,
    required this.hintText,
    this.isObsecure = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        TextFormField(
          controller: controller,
          obscureText: isObsecure,
          style: getWhiteTextStyle(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppPadding.p15,
              horizontal: AppPadding.p30,
            ),
            filled: true,
            fillColor: ColorManager.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s50),
            ),
            hintText: hintText,
            hintStyle: getBlack30TextStyle(),
          ),
        ),
        const SizedBox(
          height: AppSize.s14,
        ),
      ],
    );
  }
}
