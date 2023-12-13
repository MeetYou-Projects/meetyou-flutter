import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetyou/features/likes/bloc/people_likes/people_likes_bloc.dart';
import 'package:meetyou/features/likes/views/detail_people_profile_page.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/people_liked_card_widget.dart';

class LikesPeoplePage extends StatefulWidget {
  static const String routeName = "/like-people";
  const LikesPeoplePage({Key? key}) : super(key: key);

  @override
  State<LikesPeoplePage> createState() => _LikesPeoplePageState();
}

class _LikesPeoplePageState extends State<LikesPeoplePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PeopleLikesBloc>().add(onPeopleLikesEventCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'People you\nLikes',
          style: getWhiteTextStyle(
            fontWeight: FontWeightManager.semiBold,
            fontSize: FontSizeManager.f18,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: AppSize.s30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s20,
          ),
          BlocBuilder<PeopleLikesBloc, PeopleLikesState>(
            builder: (context, state) {
              if (state is PeopleLikesLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is PeopleLikesLoaded) {
                final user = state.userMatch;
                return user.isEmpty
                    ? Center(
                        child: Text(
                          'No matched found.',
                          style: getWhiteTextStyle(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: user.length,
                          itemBuilder: (context, index) {
                            return PeopleLikedCardWidget(
                              index: index,
                              user: user[index],
                            );
                          },
                        ),
                      );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
