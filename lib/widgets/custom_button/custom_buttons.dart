import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';

import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  double? height;
  double? width;
  bool? loading = false;

  CustomButton(
      {super.key,
      this.style,
      required this.text,
      this.onPressed,
      this.borderRadius,
      this.height = 50,
        this.loading,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // padding: EdgeInsets.only(bottom: 14.h,top: 14.h),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        // height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: AppColors.customLinearGradient,
          color: AppColors.textColor,
        borderRadius: BorderRadius.circular(4.r),

        ),
        child: Center(
          child:
          loading == true?CircularProgressIndicator():
          CustomText(
            text: text,
            style: AppTextStyles.fontSize17to600.copyWith(color: AppColors.bgColor),
          ),
        ),
      ),
    );
  }
}
