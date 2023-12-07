import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/view/redeem_code_success/redeem_code_success.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/app_styles/app_text_styles.dart';
import '../../../widgets/custom_button/custom_buttons.dart';

class RedeemTextFormField extends StatefulWidget {
  @override
  State<RedeemTextFormField> createState() => _RedeemTextFormFieldState();
}

class _RedeemTextFormFieldState extends State<RedeemTextFormField> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _redeemCodeController = TextEditingController();

  var redeemCode = 'ABC';

  String? errorMessage;

  @override
  void dispose() {
    _redeemCodeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: TextFormField(
              controller: _redeemCodeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textColor,
                hintText: AppLocalizations.of(context)!.promo_code,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                hintStyle: AppTextStyles.fontSize14to400
                    .copyWith(color: AppColors.bgColor),
                prefixIcon: Padding(

                  padding: EdgeInsets.all(16.r),

                  child: Image.asset(
                    AppImages.promo,
                    color: Colors.black,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.promoCodeReq; // Display text
                  // when empty
                } else if (value != redeemCode) {
                  return null; // Valid input, return null to remove error message
                } else {
                  return null; // Valid input, return null to remove error message
                }
              },
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            height: 50.h,
            text: AppLocalizations.of(context)!.redeem_code,
            style: AppTextStyles.fontSize17to600.copyWith(fontSize: 14),
            onPressed: () {
              if (_key.currentState!.validate()) {
                Get.to(RedeemCodeSuccess());
   } else {
                setState(() {
                  errorMessage =
                      AppLocalizations.of(context)!.your_Promo_Code_is_Invalid;
                });

              }
            },
          ),
        ],
      ),
    );
  }
}
