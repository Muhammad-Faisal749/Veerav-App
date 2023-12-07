import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constant.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QrCertificateHeader extends StatelessWidget {
  final Widget text;
  final Widget img;
  const QrCertificateHeader({super.key, required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          img,
          CustomSizedBox(
            height: 5.h,
          ),
          text,
          CustomSizedBox(
            height: 12.h,
          ),
          Text(
            AppLocalizations.of(context)!.fashion,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorGrey,
              fontSize: 12.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.louis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 16.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.auth,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomSizedBox(
            height: 40.h,
          ),
          Image.asset(
            AppImages.qrCertificateScan,
            height: 120.h,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.id,
                  style: TextStyle(
                    color: AppColors.textColorGrey.withOpacity(0.5),
                    fontSize: 10.sp,
                    fontFamily: Appfonts.sfPro,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '1234567890',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: Appfonts.sfPro,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          CustomSizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.wevereev,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          CustomSizedBox(
            height: 10.h,
          ),
          CustomText(
            text: AppLocalizations.of(context)!.photosOf,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          CustomSizedBox(
            height: 10.h,
          ),
          CustomText(
            text: AppLocalizations.of(context)!.noticesFor,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          CustomSizedBox(
            height: 10,
          ),
          CustomText(
            text: AppLocalizations.of(context)!.warmRegards,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          CustomSizedBox(
            height: 10,
          ),
          CustomText(
            text: AppLocalizations.of(context)!.onlyTrustFiles,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorWhite,
              fontSize: 10.sp,
              fontFamily: Appfonts.sfPro,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
