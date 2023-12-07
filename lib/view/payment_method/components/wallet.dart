import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../widgets/custom_container/custom_container.dart';
import '../../../widgets/custom_image/custom_image.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 62.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: MediaQuery.of(context).size.width,
      color: AppColors.textColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            imgUrl: AppImages.swooshed_token,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 16.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppLocalizations.of(context)!.vereevToken,
                style: AppTextStyles.fontSize14to400.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.bgColor),
              ),
              CustomText(
                  text: AppLocalizations.of(context)!.you_Have_18,
                  style: AppTextStyles.fontSize10to500),
            ],
          )
        ],
      ),
    );
  }
}
