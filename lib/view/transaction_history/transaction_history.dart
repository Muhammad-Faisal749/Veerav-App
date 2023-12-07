import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/view/details_e_result/details_e_result.dart';
import 'package:swooshed_app/view/qr_certificate/qr_certificate.dart';
import 'package:swooshed_app/view/transaction_history/components/container.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(children: [
        CustomSizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.only(left: 10.r),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppImages.profileBackArrow,
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        AppLocalizations.of(context)!.transaction_history,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 28,
                          height: 0.8.h,
                          fontFamily: Appfonts.sfPro,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .review_your_transaction_here,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 2.5.h,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ]),
        ),
        CustomSizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.r),
            child: Column(
              children: [
                ContainerTransactionHistory(
                  onTap: () {
                    Get.to(() => QrCertificate());
                  },
                  iconPath: AppImages.historyAuthentic,
                  subtitle: AppLocalizations.of(context)!.you_got_2_token,
                  title: AppLocalizations.of(context)!.transaction_success,
                ),
                ContainerTransactionHistory(
                  onTap: () {
                    Get.to(() => DetaileResults());
                  },
                  btnText: AppLocalizations.of(context)!.pay_now,
                  iconPath: AppImages.historyWaitingPayment,
                  subtitle: AppLocalizations.of(context)!.your_top_up_will_be,
                  title: AppLocalizations.of(context)!.waiting_for_payment,
                ),
                ContainerTransactionHistory(
                  btnText: AppLocalizations.of(context)!.pay_now,
                  onTap: () {},
                  iconPath: AppImages.histryGreenclock,
                  subtitle: AppLocalizations.of(context)!.you_have_got_2_token,
                  title: AppLocalizations.of(context)!.transaction_success,
                ),
                ContainerTransactionHistory(
                  iconPath: AppImages.historyPaymentFailed,
                  subtitle: AppLocalizations.of(context)!.your_top_up_failed,
                  title: AppLocalizations.of(context)!.transaction_failed,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
