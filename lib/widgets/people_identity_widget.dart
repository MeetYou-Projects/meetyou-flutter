import 'package:flutter/material.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  final User user;
  const PeopleIdentityWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle(
              fontWeight: FontWeightManager.semiBold,
              fontSize: FontSizeManager.f28,
            ),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBlack30TextStyle(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
