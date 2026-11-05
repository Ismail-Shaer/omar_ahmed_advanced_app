import 'package:flutter/material.dart';
import 'package:omar_ahmed_advanced_app/core/theming/text_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font13GrayWeight400,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font13DarkBlueWeight500,
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font13GrayWeight400.copyWith(height: 1.7),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.font13DarkBlueWeight500,
          ),
        ],
      ),
    );
  }
}
