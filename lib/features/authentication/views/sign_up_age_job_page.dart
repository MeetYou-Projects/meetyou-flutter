import 'package:flutter/material.dart';
import 'package:meetyou/features/authentication/models/user_account_model.dart';
import 'package:meetyou/features/authentication/views/sign_up_upload_photo_page.dart';
import 'package:meetyou/theme_manager/values_manager.dart';
import 'package:meetyou/widgets/banner_widget.dart';
import 'package:meetyou/widgets/custom_button_widget.dart';
import 'package:meetyou/widgets/custom_text_field_widget.dart';

class SignUpAgeJobPage extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';
  final String fullName;
  final String email;
  final String password;

  const SignUpAgeJobPage({
    Key? key,
    required this.fullName,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _SignUpAgeJobPageState createState() => _SignUpAgeJobPageState();
}

class _SignUpAgeJobPageState extends State<SignUpAgeJobPage> {
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    occupationController.dispose();
    ageController.dispose();
  }

  String? validationInput() {
    if (ageController.text.isEmpty || occupationController.text.isEmpty) {
      return "Age or Occupation can\'t be empty.";
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
                labelName: 'Occupation',
                hintText: 'Write your occupation',
                controller: occupationController,
              ),
              CustomTextFieldWidget(
                labelName: 'Age',
                hintText: 'Write your age',
                controller: ageController,
              ),
              const SizedBox(
                height: AppSize.s50,
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
                  UserAccount userAccount = UserAccount(
                    fullName: widget.fullName,
                    email: widget.email,
                    password: widget.password,
                    age: ageController.text,
                    occupation: occupationController.text,
                  );
                  Navigator.pushNamed(
                    context,
                    SignUpUploadPhotoPage.routeName,
                    arguments: userAccount,
                  );
                },
                text: 'Continue Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
