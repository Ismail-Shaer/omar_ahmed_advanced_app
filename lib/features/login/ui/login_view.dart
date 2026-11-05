import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:omar_ahmed_advanced_app/core/shared_widgets/custom_text_button.dart';
import 'package:omar_ahmed_advanced_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:omar_ahmed_advanced_app/core/theming/app_colors.dart';
import 'package:omar_ahmed_advanced_app/core/theming/text_styles.dart';
import 'package:omar_ahmed_advanced_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:omar_ahmed_advanced_app/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueWeight700),
                Gap(8.h),
                Text(
                  "We're excited to have you back, can't wait to\n see what you've been up to since you\n last logged in.",
                  style: TextStyles.font14GrayWeight400,
                ),
                Gap(36.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(hintText: "Email"),
                      Gap(16.h),
                      CustomTextFormField(
                        hintText: "Password",
                        isObscure: isObscure,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            color: AppColors.mainBlue,
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      Gap(24.h),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.font12BlueWeight400,
                        ),
                      ),
                      Gap(40.h),
                      CustomTextButton(buttonText: "Login", onPressed: () {}),
                      Gap(24.h),
                      TermsAndConditionsText(),
                      Gap(16.h),
                      DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
