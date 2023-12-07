import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';

import '../../utils/app_fonts/app_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double height;
  final double width;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.textColorWhite,
          // gradient: AppColors.buttonGradient,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

        ),
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.bgColor,
            // color: AppColors.textColor,
            fontSize: 16,
            fontFamily: Appfonts.sfPro,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        )),
      ),
    );
  }
}
