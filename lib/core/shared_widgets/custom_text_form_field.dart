import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmed_advanced_app/core/theming/app_colors.dart';
import 'package:omar_ahmed_advanced_app/core/theming/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyles;
  final bool? isObscure;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyles,
    this.hintStyle,
    this.isObscure,
    this.suffixIcon,
    this.controller,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayWeight400,
        isDense: true,
        contentPadding:contentPadding?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        //////  focusedBorder   ///////
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.mainBlue, width: 1.3),
            ),
        /////   enabledBorder ///////
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.lightGray, width: 1.3),
            ),
      ),
      obscureText: isObscure ?? false,
      style: TextStyles.font14DarkBlueWeight500,
    );
  }
}
