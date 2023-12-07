import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import '../../utils/app_styles/app_text_styles.dart';
import '../../widgets/custom_button/custom_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_image/custom_image.dart';
import '../../widgets/custom_text/custom_text.dart';

class RedeemCodeSuccess extends StatelessWidget {
  const RedeemCodeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                CustomImage(
                  imgUrl: AppImages.submitted_check,
                  height: 64,
                ),
                SizedBox(height: 24),
                CustomText(
                  text: AppLocalizations.of(context)!.promoSuccess,
                  style: AppTextStyles.heading1,
                ),
                SizedBox(height: 24),
                CustomText(
                  text: AppLocalizations.of(context)!.congrats,
                  style: AppTextStyles.fontSize14to400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: AppLocalizations.of(context)!.tokens20,
                  style: AppTextStyles.fontSize18to700.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                ),
                CustomButton(
                  text: AppLocalizations.of(context)!.startChecking,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
