import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/style_manager.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomTextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: getBlack30TextStyle().copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
