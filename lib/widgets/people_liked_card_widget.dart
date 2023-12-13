import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetyou/features/likes/bloc/people_likes/people_likes_bloc.dart';
import 'package:meetyou/features/likes/data/data_match_dummy.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meetyou/features/likes/views/detail_people_profile_page.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/color_manager.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';

class PeopleLikedCardWidget extends StatelessWidget {
  final int index;
  final User user;
  const PeopleLikedCardWidget({
    Key? key,
    required this.index,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(user.fullName),
      onDismissed: (direction) {
        dataMatchDummy.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('You remove ${user.fullName} from your matched')));
        context.read<PeopleLikesBloc>().add(onPeopleLikesEventCalled());
      },
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailPeopleProfilePage.routeName,
              arguments: user);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: AppMargin.m18),
            decoration: BoxDecoration(
              color: ColorManager.secondary,
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p10,
                vertical: AppPadding.p4,
              ),
              leading: Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "${AssetImageIconManager.assetPath}/${user.imageProfile}"),
                  ),
                ),
              ),
              title: Text(
                user.fullName,
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f18,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              subtitle: Text(
                '${user.age}, ${user.occupation}',
                style: getGrey60TextStyle(
                  fontSize: FontSizeManager.f14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
