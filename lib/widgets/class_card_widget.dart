import 'package:flutter/material.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

class ClassCardWidget extends StatelessWidget {
  final User user;
  const ClassCardWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m26,
        horizontal: AppMargin.m30,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p15,
        horizontal: AppPadding.p24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        image: const DecorationImage(
          image: AssetImage(
              "${AssetImageIconManager.assetPath}/glass_card_image.png"),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.fullName,
                style: getWhiteTextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontSize: 20,
                ),
              ),
              Text(
                '${user.age}, ${user.occupation}',
                style: getWhiteTextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '${AssetImageIconManager.assetPath}/icon_profile.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
