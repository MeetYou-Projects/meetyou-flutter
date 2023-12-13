import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/color_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButtonWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s50),
          gradient: LinearGradient(
            colors: [
              ColorManager.pink,
              ColorManager.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          text,
          style: getWhiteTextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
