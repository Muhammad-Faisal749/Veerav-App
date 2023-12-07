import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), // Corrected borderRadius
        color: AppColors.textColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ // Added children property to the Column
            ///Summary Text
            CustomText(
              text: AppLocalizations.of(context)!.summery,
              style: AppTextStyles.fontSize14to700.copyWith(
                color: AppColors.bgColor,
              ),
            ),
            CustomSizedBox(height: 24.h),
            ///Order Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.order,
                  style: AppTextStyles.fontSize12to300.copyWith(
                    color: AppColors.bgColor,
                  ),
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.iDR,
                  style: AppTextStyles.fontSize12to300
                      .copyWith(fontWeight: FontWeight.w500,),
                ),
              ],
            ),
            CustomSizedBox(height: 16.h),
            ///Tax Row Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.tax,
                  style: AppTextStyles.fontSize12to300,
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.iDR,
                  style: AppTextStyles.fontSize12to300
                      .copyWith(fontWeight: FontWeight.w500,),
                ),
              ],
            ),
            CustomSizedBox(height: 16.h),
            ///Service Charge Row Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.serviceCharge,
                  style: AppTextStyles.fontSize12to300,
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.iDR,
                  style: AppTextStyles.fontSize12to300
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            CustomSizedBox(height: 24.h),
            ///Total Row Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.total,
                  style: AppTextStyles.fontSize12to300,
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.iDR,
                  style: AppTextStyles.fontSize12to300
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
