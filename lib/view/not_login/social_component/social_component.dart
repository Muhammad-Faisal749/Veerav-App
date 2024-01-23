import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';

// ignore: must_be_immutable
class SocialComponent extends StatelessWidget {
  SocialComponent({super.key, this.image,this.onTap});

  String? image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.textColor
        ),
        child: Center(
          child: SvgPicture.asset(
            image.toString(),
            width: 18.w,
            height: 18.h,
          ),
        ),
      ),
    );
  }
}
