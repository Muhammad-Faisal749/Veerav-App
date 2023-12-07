import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/view/bottom_nav_bar/nav_bar.dart';
import 'package:swooshed_app/view/home/home.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/custom_sized_box/custom_sized_box.dart';

class ContainerTransactionHistory extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final String? btnText;
  final void Function()? onTap;
  const ContainerTransactionHistory(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.subtitle,
      this.btnText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.r),
        width: double.infinity,
        height: 90.h,
        padding: EdgeInsets.all(12.r),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.r),
          ),
        ),
        child: Stack(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 32.w,
                height: 32.h,
                padding: EdgeInsets.all(5.r),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColors.textColor,
                  shadows: [
                    BoxShadow(
                      color: AppColors.bgColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Center(
                    child: Image.asset(
                  iconPath,
                  height: 16.h,
                )),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: title == "Transaction Success"
                          ? const Color(0xFF3BFF72)
                          : title == "Transaction Failed"
                              ? const Color(0xFFFF554C)
                              : const Color(0xFFFFD56C),
                      fontSize: 10.sp,
                      fontFamily: Appfonts.sfPro,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.08,
                    ),
                  ),
                  CustomSizedBox(
                    height: 5.w,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 12,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Positioned(
                bottom: 0,
                right: 0,
                child: btnText == "Pay Now"
                    ? GestureDetector(
                        onTap: () {
                          Get.to(BottomNav());
                        },
                        child: Container(
                          width: 80.w,
                          height: 25.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppColors.textColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                              child: Text(
                            'Pay Now',
                            style: TextStyle(
                              color: AppColors.bgColor,
                              fontSize: 10,
                              fontFamily: Appfonts.sfPro,
                              fontWeight: FontWeight.w500,
                              height: 0.19,
                            ),
                          )),
                        ),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
