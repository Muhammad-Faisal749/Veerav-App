import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(children: [
        CustomSizedBox(
          height: 50.h,
        ),
        Padding(
          padding:  EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding:  EdgeInsets.only(top: 7.h),
                  child: Image.asset(
                    AppImages.profileBackArrow,
                    height: 17.h,
                    width: 20.w,
                  ),
                ),
              ),
              CustomSizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Us",
                      style: AppTextStyles.heading1),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                        "Here is Information About Organization in Real World",
                        maxLines: 2,
                        style: AppTextStyles.fontSize14to400.copyWith(
                            color: AppColors.textColorWhite,

                            fontSize: 16)),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
