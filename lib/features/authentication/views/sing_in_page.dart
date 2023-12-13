import 'package:flutter/material.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/banner_widget.dart';
import 'package:meetyou/widgets/custom_button_widget.dart';
import 'package:meetyou/widgets/custom_text_button_widget.dart';
import 'package:meetyou/widgets/custom_text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validationInput() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return "Name or Email or Password can\'t be empty.";
    }

    if (emailController.text.length < 8 || passwordController.text.length < 8) {
      return "Too short. Minimum 8 characters.";
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
        padding: const EdgeInsets.only(
          top: AppPadding.p50,
          left: AppPadding.p24,
          right: AppPadding.p24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(
                withHeroImage: true,
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
