import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:meetyou/widgets/match_button_widget.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({Key? key, required this.controller})
      : super(key: key);

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          onTap: () {
            controller.swipeLeft();
          },
          iconPath: 'icon_close.png',
        ),
        MatchButtonWidget(
          onTap: () {
            controller.swipe();
          },
          iconPath: 'icon_love.png',
          dimension: 80.0,
        ),
        MatchButtonWidget(
          onTap: () {
            controller.swipeRight();
          },
          iconPath: 'icon_favorite.png',
        ),
      ],
    );
  }
}
