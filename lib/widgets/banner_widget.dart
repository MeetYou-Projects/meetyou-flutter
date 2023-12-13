import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

class BannerWidget extends StatelessWidget {
  bool withTagLine;
  bool withHeroImage;
  BannerWidget({
    Key? key,
    this.withTagLine = true,
    this.withHeroImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "${AssetImageIconManager.assetPath}/icon_logo.png",
              width: 160,
            ),
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          withTagLine
              ? Text(
                  'Meet your perfect love.',
                  style: getWhiteTextStyle(),
                )
              : const SizedBox(),
          const SizedBox(
            height: AppSize.s30,
          ),
          withHeroImage
              ? Image.asset("${AssetImageIconManager.assetPath}/hero_image.png")
              : const SizedBox(),
          withHeroImage
              ? const SizedBox(
                  height: AppSize.s30,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
