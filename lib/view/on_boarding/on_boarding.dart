import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: 0.8,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImages.onBoardingBg3))),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 267.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)),
                gradient: AppColors.onBoardingGradientColor,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: AppLocalizations.of(context)!.buy_without,
                        style: AppTextStyles.heading1.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    CustomSizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Center(
                        child: CustomText(
                          maxLines: 3,
                          text: AppLocalizations.of(context)!.onBoardingText,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.fontSize14to400
                              .copyWith(color: Colors.white,overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    CustomSizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.r),
                      child: CustomButton(
                        text: AppLocalizations.of(context)!.get_started,
                        onPressed: () {
                          Get.toNamed('/NotLoginScreen');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
