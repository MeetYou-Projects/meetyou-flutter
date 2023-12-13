import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meetyou/features/authentication/data/data_user_account_local.dart';
import 'package:meetyou/features/authentication/views/sign_up_age_job_page.dart';
import 'package:meetyou/features/authentication/views/sign_up_page.dart';
import 'package:meetyou/features/likes/views/likes_people_page.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  final String? imagePath;
  const ExplorePeopleAppBarWidget({Key? key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            UserAccountRegister.userAccountLogout();
            Navigator.pushNamedAndRemoveUntil(
                context, SignUpPage.routeName, (route) => false);
          },
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imagePath != null
                    ? FileImage(File(imagePath!))
                    : const AssetImage(
                        '${AssetImageIconManager.assetPath}/user_image.png',
                      ) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Image.asset(
          "${AssetImageIconManager.assetPath}/icon_logo.png",
          width: 160,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, LikesPeoplePage.routeName),
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "${AssetImageIconManager.assetPath}/icon_notification.png",
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
