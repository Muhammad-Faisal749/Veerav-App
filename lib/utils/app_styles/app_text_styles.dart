import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';

class AppTextStyles {
  ///Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
    overflow: TextOverflow.ellipsis,

  );

  ///Text Styles of fontSize20to400 and color white
  static const TextStyle fontSize20to400 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    overflow: TextOverflow.ellipsis,
  );

  ///Text Styles of fontSize20to400 and color white
  static const TextStyle fontSize10to500 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor3,
    overflow: TextOverflow.ellipsis,
  );

  ///Text Styles of fontSize20to400 and color white
  static const TextStyle fontSize17to600 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  ///Text Styles of fontSize14to400 and color white
  static const TextStyle fontSize14to400 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.hintTextColor,
    overflow: TextOverflow.ellipsis,

  );

  static const TextStyle fontSize14to700 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.bgColor,
  );

  static const TextStyle fontSize12to300 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.bgColor,
  );

  static TextStyle fontSize42to700 = const TextStyle(
    fontSize: 42,
    color: AppColors.bgColor,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro',
  );

  // Bottom Navigation
  static TextStyle bottomNavStyle = TextStyle(
    color: AppColors.textColorWhite,
    fontSize: 10.sp,
    fontFamily: 'SF Pro',
    fontWeight: FontWeight.w500,
    height: 0.h,
    letterSpacing: -0.24,
  );

  ///Text Styles of fontSize14to400 and color white
  static const TextStyle fontSize18to700 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
    overflow: TextOverflow.ellipsis
  );
}
