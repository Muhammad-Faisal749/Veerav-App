import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final String preffix;
  final void Function() ontap;
  const RowWidget(
      {super.key,
      required this.text,
      required this.preffix,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    String truncateTextToThreeWords(String text) {
      List<String> words = text.split(' ');
      if (words.length <= 3) {
        return text;
      } else {
        return '${words.sublist(0, 3).join(' ')}...';
      }
    }

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                preffix,
                height: 20.h,
                width: 20.w,
                color: AppColors.bgColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                truncateTextToThreeWords(text),
                style: TextStyle(
                  color: AppColors.bgColor,
                  fontSize: 14,
                  fontFamily: Appfonts.sfPro,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AppImages.profileRightAngle,
              height: 15.h,
              width: 12.w,
              color: AppColors.bgColor,
            ),
          )
        ]),
      ),
    );
  }
}
