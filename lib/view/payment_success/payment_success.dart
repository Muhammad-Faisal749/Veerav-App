
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/history/history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/view/transaction_history/transaction_history.dart';
import 'package:swooshed_app/view/wallet/wallet.dart';

import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomSizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSizedBox(
                height: 230.h,
              ),
              SvgPicture.asset(
                AppImages.varificationImage,
                width:  73.w,
                height: 76.h,
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              CustomText(
                text: AppLocalizations.of(context)!.ps,
                style: AppTextStyles.heading1,
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              CustomText(
                text: AppLocalizations.of(context)!.thank_you,
                textAlign: TextAlign.center,
              ),
              CustomSizedBox(
                height: 150.h ,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.r),
                child: CustomButton(
                  text: AppLocalizations.of(context)!.payment,
                  onPressed: (){
                    Get.to(HistoryScreen());
                  },
                ),
              ),

            ])
    )
    )
    );
    }
}
