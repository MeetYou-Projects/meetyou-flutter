import 'package:flutter/material.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meetyou/features/likes/views/explore_people_page.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/custom_button_widget.dart';
import 'package:meetyou/widgets/match_button_widget.dart';
import 'package:meetyou/widgets/people_identity_widget.dart';

class DetailPeopleProfilePage extends StatelessWidget {
  static const String routeName = "/detail-people-profile";
  const DetailPeopleProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 320.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "${AssetImageIconManager.assetPath}/${user.imageProfile}"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p40,
                    horizontal: AppPadding.p26,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MatchButtonWidget(
                        iconPath: 'icon_arrow_left.png',
                        dimension: 22.0,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Likes Profile\nDetails',
                        style: getWhiteTextStyle(
                          fontWeight: FontWeightManager.semiBold,
                          fontSize: FontSizeManager.f18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      MatchButtonWidget(
                        iconPath: 'icon_close_circle.png',
                        dimension: 22.0,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ExplorePeoplePage.routeName, (route) => false);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            PeopleIdentityWidget(user: user),
            Container(
              height: 80,
              margin: const EdgeInsets.only(
                left: AppMargin.m24,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    height: 80.0,
                    margin: const EdgeInsets.only(
                      right: AppMargin.m16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s18),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "${AssetImageIconManager.assetPath}/hobby1_image.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
              ),
              child: CustomButtonWidget(
                onTap: () {},
                text: 'Chat Now',
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
          ],
        ),
      ),
    );
  }
}
