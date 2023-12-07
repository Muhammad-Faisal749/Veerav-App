import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import '../../widgets/custom_button/custom_buttons.dart';
import '../../widgets/custom_image/custom_image.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../categories/categories.dart';

class GetStarted extends StatelessWidget {
    GetStarted({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: MediaQuery.of(context).size.height / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  imgUrl: AppImages.getStartImage,
                  width: 76.w,
                  height: 76.h,
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: AppLocalizations.of(context)!.lets_Get_Started,
                  style: AppTextStyles.heading1,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 300.w,
                  child: CustomText(
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    text: AppLocalizations.of(context)!.you_are_one_step_closer,
                    style: AppTextStyles.fontSize14to400.copyWith(),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  text:AppLocalizations.of(context)!.start_now,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Categories(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text:AppLocalizations.of(context)!.maybe_later,
                  style: AppTextStyles.fontSize14to400.copyWith(
                      fontWeight: FontWeight.w600, letterSpacing: 0.408),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
