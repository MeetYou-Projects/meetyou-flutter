import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetyou/features/authentication/bloc/auth_bloc.dart';
import 'package:meetyou/features/authentication/models/user_account_model.dart';
import 'package:meetyou/features/likes/views/explore_people_page.dart';
import 'package:meetyou/theme_manager/font_manager.dart';
import 'package:meetyou/theme_manager/style_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/utils/image_picker_util.dart';
import 'package:meetyou/widgets/banner_widget.dart';
import 'package:meetyou/widgets/custom_button_widget.dart';
import 'package:meetyou/widgets/custom_text_button_widget.dart';
import 'package:meetyou/widgets/upload_photo_widget.dart';

class SignUpUploadPhotoPage extends StatefulWidget {
  static const String routeName = "/sign-up-upload-photo";
  const SignUpUploadPhotoPage({Key? key}) : super(key: key);

  @override
  _SignUpUploadPhotoPageState createState() => _SignUpUploadPhotoPageState();
}

class _SignUpUploadPhotoPageState extends State<SignUpUploadPhotoPage> {
  File? image;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, ExplorePeoplePage.routeName, (route) => false);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
            vertical: AppPadding.p50,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BannerWidget(),
                const SizedBox(
                  height: AppSize.s50,
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                              vertical: AppPadding.p15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      getImageProfile(GetImageFrom.camera),
                                  icon: const Icon(Icons.camera),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      getImageProfile(GetImageFrom.gallery),
                                  icon: const Icon(Icons.photo),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: UploadPhotoWidget(
                      image: image,
                    )),
                const SizedBox(
                  height: 53,
                ),
                Text(
                  userAccount.fullName,
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f22,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  '${userAccount.age}, ${userAccount.occupation}',
                  style: getBlack60TextStyle(),
                ),
                const SizedBox(
                  height: 120,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CircularProgressIndicator();
                    }
                    return CustomButtonWidget(
                      text: 'Update My Profile',
                      onTap: () {
                        userAccount.imageProfile = image?.path;
                        context.read<AuthBloc>().add(
                              RegisterAuthEvent(
                                  userAccount: userAccount, isRegister: true),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                CustomTextButtonWidget(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          RegisterAuthEvent(
                            userAccount: userAccount,
                            isRegister: true,
                          ),
                        );
                  },
                  title: 'Skip for Now',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
