import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmed_advanced_app/core/theming/app_colors.dart';
import 'package:omar_ahmed_advanced_app/core/theming/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonTextStyle,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppColors.mainBlue,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.infinity, buttonHeight?.h ?? 52.h),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: buttonTextStyle ?? TextStyles.font16WhiteWeight500,
      ),
    );
  }
}
