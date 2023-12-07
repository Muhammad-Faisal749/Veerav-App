import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopText extends StatelessWidget {
  const TopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding:  EdgeInsets.only(top: 6.h),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor,
            ),
          ),
        ),
        CustomSizedBox(width: 5.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSizedBox(
              width: 280.w,
              child: CustomText(
                textAlign: TextAlign.start,
                maxLines: 2,
                text: AppLocalizations.of(context)!.claim_your_gift_now,
                style: AppTextStyles.heading1,
              ),
            ),
            CustomSizedBox(
              width: 280.w,
              child: CustomText(
                maxLines: 2,
                textAlign: TextAlign.start,
                text: AppLocalizations.of(context)!.redeem_promo_code_to_get_it,
                style: AppTextStyles.fontSize14to400.copyWith(fontSize: 18.sp,color: AppColors.textColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
