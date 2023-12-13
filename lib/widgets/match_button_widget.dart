import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';

class MatchButtonWidget extends StatelessWidget {
  final double dimension;
  final String iconPath;
  final VoidCallback onTap;
  const MatchButtonWidget(
      {Key? key,
      required this.iconPath,
      this.dimension = 50.0,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("${AssetImageIconManager.assetPath}/$iconPath"),
          ),
        ),
      ),
    );
  }
}
