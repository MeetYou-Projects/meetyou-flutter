import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/color_manager.dart';

class UploadPhotoWidget extends StatelessWidget {
  final File? image;
  const UploadPhotoWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180.0,
          height: 180.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.secondary,
              width: 8.0,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image == null
                ? const Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "${AssetImageIconManager.assetPath}/profile_icon.png",
                    ),
                  )
                : Image(
                    fit: BoxFit.cover,
                    image: FileImage(
                      image!,
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: -25.0,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              "${AssetImageIconManager.assetPath}/icon_add_color.png",
            ),
          ),
        )
      ],
    );
  }
}
