import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/check_out/summary_components/summary_components.dart';
import 'package:swooshed_app/view/payment_method/payment_accounts_components/accoounts.dart';
import 'package:swooshed_app/view/payment_method_1/payment_method_1.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import '../barcode_generator/barcode_generator.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomSizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBox(
                  height: 24.h,
                ),

                ///App Bar
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Back Icon
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomSizedBox(
                            width: 18.w,
                            height: 39.h,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.textColor,
                            )),
                      ),

                      ///App Bar Text
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, top: 5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///App Bar Summary Order Text 1
                            CustomSizedBox(
                              width: 250.w,
                              child: CustomText(
                                text: AppLocalizations.of(context)!.summeryOder,
                                style: AppTextStyles.heading1,
                                textAlign: TextAlign.start,
                              ),
                            ),

                            ///App Bar checkItem Text 2
                            CustomSizedBox(
                              width: 270.w,
                              child: CustomText(
                                textAlign: TextAlign.start,
                                text: AppLocalizations.of(context)!.checkItem,
                                style: AppTextStyles.fontSize14to400
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                CustomSizedBox(
                  height: 24.h,
                ),

                ///Token Container
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Container(
                    height: 85.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.textColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///2 tokens Container
                          Container(
                            width: 53.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              color: AppColors.textColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),

                            ///Two Token Image
                            child: Center(
                              child: Image.asset(
                                AppImages.token2Image,
                                // color: Colors.blue,
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                          CustomSizedBox(
                            width: 17.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: AppLocalizations.of(context)!.tokens2S,
                                style: AppTextStyles.fontSize14to700,
                              ),
                              CustomText(
                                text: AppLocalizations.of(context)!.iDR,
                                style: AppTextStyles.fontSize14to700
                                    .copyWith(fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 24.h,
                ),

                ///Promo Code Text
                GestureDetector(
                  onTap: () {
                    Get.to(() => BarcodeGenerateScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodContainer(
                      image: AppImages.promoCodePngImage,
                      text: AppLocalizations.of(context)!.promo_code,
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 24.h,
                ),

                ///Summary Component
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: const Summary(),
                ),
                CustomSizedBox(
                  height: 100.h,
                ),

                ///Pay Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: CustomButton(
                    text: AppLocalizations.of(context)!.pay,
                    onPressed: () {
                      Get.to(PaymentMethod1());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
