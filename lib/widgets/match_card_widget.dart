import 'package:flutter/material.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/color_manager.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/class_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  final User user;
  const MatchCardWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  '${AssetImageIconManager.assetPath}/${user.imageProfile}'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: AppSize.s12,
              color: ColorManager.secondary,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: BorderRadius.circular(AppSize.s70),
          ),
        ),
        ClassCardWidget(
          user: user,
        )
      ],
    );
  }
}
