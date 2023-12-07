import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/view/payment_method/components/addcard.dart';

import 'package:swooshed_app/view/payment_success1/payment_succcess_1.dart';

import '../../controller/payment_method_provider2/payment_method_provider.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_styles/app_text_styles.dart';
import '../../widgets/custom_sized_box/custom_sized_box.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../payment_method_1/all_account_container/all_accounts.dart';

class PaymentMethod2 extends StatefulWidget {
  PaymentMethod2({Key? key});

  @override
  State<PaymentMethod2> createState() => _PaymentMethod2State();
}

class _PaymentMethod2State extends State<PaymentMethod2> {



  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodProvider>(

      builder: (context, paymentMethodProvider, child) {
        return  Scaffold(
          backgroundColor: AppColors.bgColor,
          ///App Bar
          appBar: AppBar(
            leadingWidth: double.infinity,
            toolbarHeight: 60.h,
            leading:  Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Arrow Back Icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomSizedBox(
                      width: 18.w,
                      height: 39.h,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 5.h,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Payment Method Text 1
                        CustomText(
                          text: AppLocalizations.of(context)!.last_step,
                          style: AppTextStyles.fontSize18to700,
                        ),

                        ///Choose Payment Method Text
                        CustomSizedBox(
                          width: 250.w,
                          child: CustomText(
                              textAlign: TextAlign.start,
                              text:
                              AppLocalizations.of(context)!.payment_method,
                              style: AppTextStyles.heading1

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Bottom Container Total Text and pay Button
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.textColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///Total Text
                    CustomText(
                      text: AppLocalizations.of(context)!.total,
                      style: AppTextStyles.fontSize12to300,
                    ),
                    CustomText(
                      text: AppLocalizations.of(context)!.tokens2,
                      style:
                      AppTextStyles.heading1.copyWith(color: AppColors.bgColor),
                    ),

                    /// Text 3
                    CustomText(
                        text: AppLocalizations.of(context)!.iDR,
                        style: AppTextStyles.fontSize14to400),
                    // GradientText(),
                  ],
                ),

                ///Pay Button
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        // spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(
                            0, 3), // Offset to control the position of the shadow
                      ),
                    ],
                    color: paymentMethodProvider.selectedButton == true
                        ? AppColors.textColor
                        : AppColors.hintTextColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    onPressed: paymentMethodProvider.selectedButton == true
                        ? () {
                      Get.to(PaymentSuccess1());
                    }
                        : null,
                    child: CustomText(
                      style: AppTextStyles.fontSize14to400.copyWith(
                          fontWeight: FontWeight.w600,
                          color: paymentMethodProvider.selectedButton == false
                              ? AppColors.textColor
                              : AppColors.bgColor),
                      text: AppLocalizations.of(context)!.pay,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  ///Wallet Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomText(
                      text: AppLocalizations.of(context)!.wallet,
                      style: AppTextStyles.fontSize14to400.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.textColor),
                    ),
                  ),
                  CustomSizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Container(
                      height: 57.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.textColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 16.w),
                            child: Container(
                              width: 23.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.textColor,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.ypurauthenticationgalleypicturelogo,
                                  width: 10.w,
                                  height: 10.h,
                                  color: AppColors.bgColor,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: AppLocalizations.of(context)!.vereev_App,
                                style: AppTextStyles.fontSize14to400.copyWith(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              CustomText(
                                text: AppLocalizations.of(context)!.you_Have_18,
                                style: AppTextStyles.fontSize10to500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomSizedBox(
                    height: 24.h,
                  ),

                  ///Virtual Account Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomText(
                        text: AppLocalizations.of(context)!.virtual_account,
                        style: AppTextStyles.fontSize14to700
                            .copyWith(color: AppColors.textColor)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///BCA Virtual Account Component
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodAccounts(
                      onTap: () {
                        paymentMethodProvider.handleContainerTap(0);
                        print("Clicked o ${paymentMethodProvider.selectedPaymentIndex}");
                      },
                      image: AppImages.paymentMethodImage1,
                      text: AppLocalizations.of(context)!.bca,
                      color: paymentMethodProvider.selectedPaymentIndex == 0
                          ? AppColors.textColor3
                          : AppColors.textColor,
                    ),
                  ),
                  CustomSizedBox(
                    height: 12.h,
                  ),

                  ///Mandiri Virtual Account Component
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodAccounts(
                      onTap: () {
                        paymentMethodProvider.handleContainerTap(1);
                      },
                      image: AppImages.paymentMethodImage2,
                      text: AppLocalizations.of(context)!.mandiri,
                      color: paymentMethodProvider.selectedPaymentIndex  == 1
                          ? AppColors.textColor3
                          : AppColors.textColor,
                    ),
                  ),
                  CustomSizedBox(
                    height: 24.h,
                  ),

                  /// Bank Transfer Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomText(
                      text: AppLocalizations.of(context)!.bank_transfer,
                      style: AppTextStyles.fontSize14to700
                          .copyWith(color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///Transfer via BCA Component
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodAccounts(
                      onTap: () {
                        paymentMethodProvider.handleContainerTap(2);
                      },
                      image: AppImages.paymentMethodImage1,
                      text: AppLocalizations.of(context)!.via_bca,
                      color: paymentMethodProvider.selectedPaymentIndex  == 2
                          ? AppColors.textColor3
                          : AppColors.textColor,
                    ),
                  ),
                  CustomSizedBox(
                    height: 12.h,
                  ),

                  ///Transfer via Mandiri Component
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodAccounts(
                      onTap: () {
                        paymentMethodProvider.handleContainerTap(3);
                      },
                      image: AppImages.paymentMethodImage2,
                      text: AppLocalizations.of(context)!.via_bank,
                      color: paymentMethodProvider.selectedPaymentIndex  == 3
                          ? AppColors.textColor3
                          : AppColors.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///Debit/Credit Card Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomText(
                      text: AppLocalizations.of(context)!.dc,
                      style: AppTextStyles.fontSize14to700
                          .copyWith(color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///Add Credit Card Component
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PaymentMethodAccounts(
                      onTap: () {
                        showBottomSheet(context);
                        paymentMethodProvider.handleContainerTap(4);
                      },
                      icon: Icons.add,
                      text: AppLocalizations.of(context)!.add_credit,
                      color: paymentMethodProvider.selectedPaymentIndex  == 4
                          ? AppColors.textColor3
                          : AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,

      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height:350.h,
            color: AppColors.textColor, // White background
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.bgColor,

              ),
              child: Container(
                // height: 400.h,
                child: Column(
                  children: [addCard()],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
