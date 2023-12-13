import 'package:flutter/material.dart';
import 'package:meetyou/features/authentication/data/data_user_account_local.dart';
import 'package:meetyou/features/authentication/views/sign_up_age_job_page.dart';
import 'package:meetyou/features/authentication/views/sign_up_upload_photo_page.dart';
import 'package:meetyou/features/likes/views/detail_people_profile_page.dart';
import 'package:meetyou/features/likes/views/likes_people_page.dart';
import 'package:meetyou/theme_manager/theme_data_manager.dart';
import 'package:meetyou/features/authentication/views/sign_up_page.dart';

import 'features/likes/views/explore_people_page.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegister = false;

  isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegister();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserRegister();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationThemeData(),
      home: isRegister ? const ExplorePeoplePage() : const SignUpPage(),
      routes: {
        SignUpPage.routeName: (context) => const SignUpPage(),
        SignUpUploadPhotoPage.routeName: (context) =>
            const SignUpUploadPhotoPage(),
        ExplorePeoplePage.routeName: (context) => const ExplorePeoplePage(),
        LikesPeoplePage.routeName: (context) => const LikesPeoplePage(),
        DetailPeopleProfilePage.routeName: (context) =>
            const DetailPeopleProfilePage()
      },
    );
  }
}
