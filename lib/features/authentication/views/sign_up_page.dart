import 'package:flutter/material.dart';
import 'package:meetyou/features/authentication/views/sign_up_age_job_page.dart';
import 'package:meetyou/theme_manager/asset_image_icon_manager.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/custom_text_button_widget.dart';
import 'package:meetyou/widgets/custom_text_field_widget.dart';
import 'package:meetyou/widgets/banner_widget.dart';

import '../../../widgets/custom_button_widget.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validationInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return "Name or Email or Password can\'t be empty.";
    }

    if (nameController.text.length < 4 ||
        emailController.text.length < 4 ||
        passwordController.text.length < 4) {
      return "Too short. Minimum 4 characters.";
    }

    if (!emailController.text.contains('@')) {
      return "Pleas input email valid";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p50,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(
                withHeroImage: true,
              ),
              CustomTextFieldWidget(
                labelName: 'Complete Name',
                hintText: 'Write your name',
                controller: nameController,
              ),
              CustomTextFieldWidget(
                labelName: 'Email Address',
                hintText: 'Write your mail address',
                controller: emailController,
              ),
              CustomTextFieldWidget(
                labelName: 'Password',
                hintText: 'Write your security',
                controller: passwordController,
                isObsecure: true,
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              CustomButtonWidget(
                onTap: () {
                  final message = validationInput();
                  if (message != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpAgeJobPage(
                        fullName: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
                text: 'Get Started',
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomTextButtonWidget(
                onPressed: () {},
                title: 'Sign in to My Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
