import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetyou/features/authentication/data/data_user_account_local.dart';
import 'package:meetyou/features/authentication/models/user_account_model.dart';
import 'package:meetyou/features/likes/bloc/explore_people/explore_people_bloc.dart';
import 'package:meetyou/features/likes/bloc/people_likes/people_likes_bloc.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/explore_people_button_widget.dart';
import 'package:meetyou/widgets/match_card_widget.dart';

import '../../../widgets/explore_people_app_bar_widget.dart';

class ExplorePeoplePage extends StatefulWidget {
  static const String routeName = "/explore-people";
  const ExplorePeoplePage({Key? key}) : super(key: key);

  @override
  State<ExplorePeoplePage> createState() => _ExplorePeoplePageState();
}

class _ExplorePeoplePageState extends State<ExplorePeoplePage> {
  UserAccount? userAccount;
  final cardController = AppinioSwiperController();

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    userAccount = result;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUserAccount();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p40,
          horizontal: AppPadding.p24,
        ),
        child: Column(
          children: [
            ExplorePeopleAppBarWidget(imagePath: userAccount?.imageProfile),
            const SizedBox(
              height: AppSize.s30,
            ),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ExplorePeopleLoaded) {
                  final users = state.result;
                  List<Widget> cards = [];
                  for (var user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AppinioSwiper(
                            direction: AppinioSwiperDirection.top,
                            controller: cardController,
                            cardsBuilder: (context, index) {
                              return cards[index];
                            },
                            padding: EdgeInsets.zero,
                            cardsCount: cards.length,
                            onSwipe: (index, direction) {
                              if (direction == AppinioSwiperDirection.top) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'You matched with ${users[index].fullName}'),
                                  ),
                                );
                              }
                              if (direction != AppinioSwiperDirection.left &&
                                  direction != AppinioSwiperDirection.right &&
                                  direction != AppinioSwiperDirection.bottom) {
                                context.read<PeopleLikesBloc>().add(
                                      AddPeopleLikesEvent(
                                        users[index],
                                      ),
                                    );
                              }
                            },
                            onEnd: () {
                              context
                                  .read<ExplorePeopleBloc>()
                                  .add(OnExplorePeopleEventCalled());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        ExplorePeopleButtonWidget(
                          controller: cardController,
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
