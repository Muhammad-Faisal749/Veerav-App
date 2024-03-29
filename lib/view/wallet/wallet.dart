

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swooshed_app/controller/get_token_provider/get_token_provider.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../payment_method/payment_accounts_components/accoounts.dart';
import 'buy_token_component/buy_token_component.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    super.key,
  });

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetTokenProvider>(context,listen: false).getTokenApi();
  }

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Provider.of<GetTokenProvider>(context,listen: false).getTokenApi();
          },
          child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(
                    height: 12.h,
                  ),
                  Container(
                    // height: 98.5.h,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.textColor),
                    child: Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Logo Image Swooshed
                          Row(
                            children: [
                              Image.asset(
                                AppImages.logoapp_pngfull,
                                height: 15,
                                color: AppColors.bgColor,
                              ),
                              CustomSizedBox(
                                width: 5.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!.tokens,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: Appfonts.sfPro,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          CustomSizedBox(
                            height: 5.h,
                          ),

                          /// Token Text
                          Consumer<GetTokenProvider>(
                            builder: (context, getTokenProvider, child) {
                              return getTokenProvider.tokenList.length != 0
                                  ? getTokenProvider.tokenList[0].user!.token != null
                                  ? RichText(
                                text: TextSpan(

                                  children: <TextSpan>[
                                    TextSpan(
                                        text: getTokenProvider
                                            .tokenList[0].user!.token
                                            .toString(),
                                        style: AppTextStyles
                                            .fontSize42to700),
                                    TextSpan(
                                      text: ' ', // Add a space here
                                    ),
                                    TextSpan(
                                      text:
                                      AppLocalizations.of(context)!
                                          .tokens,
                                      style: AppTextStyles
                                          .fontSize42to700
                                          .copyWith(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                                  : Text("Not Found")

                                  : Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.white70,
                                child: RichText(
                                  text: TextSpan(

                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "0",
                                          style: AppTextStyles
                                              .fontSize42to700),
                                      TextSpan(
                                        text: ' ', // Add a space here
                                      ),
                                      TextSpan(
                                        text:
                                        AppLocalizations.of(context)!
                                            .tokens,
                                        style: AppTextStyles
                                            .fontSize42to700
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomSizedBox(
                    height: 12.h,
                  ),

                  ///Redeem Promo Code Component
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('RedeemPromoCode');
                    },
                    child: PaymentMethodContainer(
                      image: AppImages.promoCodePngImage,
                      text: AppLocalizations.of(context)!.redeem_promo_code,
                    ),
                  ),
                  CustomSizedBox(
                    height: 12.h,
                  ),

                  ///Show Transaction History Component
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/TransactionHistory');
                    },
                    child: PaymentMethodContainer(
                      image: AppImages.historyImage,
                      text:
                          AppLocalizations.of(context)!.show_transaction_history,
                    ),
                  ),
                  CustomSizedBox(
                    height: 32.h,
                  ),

                  ///Buy Token Text
                  CustomText(
                    text: AppLocalizations.of(context)!.buy_token,
                    style: AppTextStyles.fontSize14to700
                        .copyWith(color: AppColors.textColor),
                  ),
                  CustomSizedBox(
                    height: 16.h,
                  ),

                  ///Buy Token Component
                  const BuyTokenComponent()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
