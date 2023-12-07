import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/bottom_nav_bar/nav_bar.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentSuccess1 extends StatefulWidget {
  const PaymentSuccess1({super.key});

  @override
  _PaymentSuccess1State createState() => _PaymentSuccess1State();
}

class _PaymentSuccess1State extends State<PaymentSuccess1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: CustomSizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomSizedBox(
                    height: 150.h,
                  ),
                  SvgPicture.asset(
                    AppImages.varificationImage,
                    width: 73.w,
                    height: 76.h,
                  ),
                  CustomSizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    text: AppLocalizations.of(context)!.request,
                    style: AppTextStyles.heading1,
                  ),
                  CustomSizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    text: AppLocalizations.of(context)!.thanks,
                    textAlign: TextAlign.center,
                  ),
                  CustomSizedBox(
                    height: 90.h,
                  ),
                  CustomText(
                    text: AppLocalizations.of(context)!.info,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.fontSize12to300.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                  CustomSizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.r),
                    child: CustomButton(
                      text: AppLocalizations.of(context)!.payment,
                      onPressed: () {
                        Get.to(BottomNav());
                      },
                    ),
                  ),
                ]))));
  }
}
