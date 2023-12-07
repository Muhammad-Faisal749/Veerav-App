import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: ShapeDecoration(
          color: AppColors.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4), // Shadow color
                        offset: Offset(0, 4), // Offset from the top
                        blurRadius: 6, // Spread of the shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.profileUser,
                      color: AppColors.bgColor,
                      height: 16.h,
                      width: 18.w,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VERRY KURNIAWAN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 12.sp,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                        letterSpacing: -0.08,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '@verrykurniawan',
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 10.sp,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppImages.profileRightAngle,
                color: AppColors.bgColor,
                height: 15.h,
                width: 12.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
