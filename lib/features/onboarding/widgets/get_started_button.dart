import 'package:flutter/material.dart';

import 'package:omar_ahmed_advanced_app/core/helpers/extensions.dart';
import 'package:omar_ahmed_advanced_app/core/routing/app_routes.dart';
import 'package:omar_ahmed_advanced_app/core/theming/app_colors.dart';

import '../../../core/theming/text_styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(AppRoutes.loginRoute);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text('Get Started', style: TextStyles.font16WhiteMedium),
    );
  }
}
