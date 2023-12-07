import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/check_out/check_out.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../model/wallet_token_model/wallet_token.dart';

class BuyTokenComponent extends StatelessWidget {
  const BuyTokenComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myTokenData = myTokenDataList(context);

    return SizedBox(
      height: 650.h,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250.h,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: myTokenData.length,
        itemBuilder: (context, index) {
          ///Top Container
          return Container(
            // height: 255.h,
            // width: 155.w,

            padding: EdgeInsets.symmetric(vertical: 10.h),
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
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SizedBox(
                    height: 105.h,
                    width: double.infinity,
                    child: Container(
                      height: 105.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.bgColor.withOpacity(0.2),
                            // spreadRadius: 2,
                            blurRadius: 3,
                            // offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              top: 15.h,
                              // bottom: 10,
                            ),
                            child: Image.asset(
                              myTokenData[index].image.toString(),
                              width: myTokenData[index].width,
                              height: myTokenData[index].height,
                            ),
                          ),
                          // const Spacer(),
                          CustomSizedBox(
                            height: 7.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: CustomText(
                              text: myTokenData[index].text.toString(),
                              style: AppTextStyles.fontSize10to500.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.bgColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: myTokenData[index].price.toString(),
                  style: AppTextStyles.fontSize14to700.copyWith(
                      color: AppColors.bgColor,
                      overflow: TextOverflow.ellipsis),
                ),
                CustomSizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    // padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.bgColor.withOpacity(0.2),
                            // spreadRadius: 2,
                            blurRadius: 4,
                            // offset: Offset(0, 3),
                          ),
                        ]),
                    child: CustomButton(
                      height: 36.h,
                      onPressed: () {
                        Get.to(const CheckoutScreen());
                      },
                      text: AppLocalizations.of(context)!.buy,
                      style:
                          AppTextStyles.fontSize17to600.copyWith(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
