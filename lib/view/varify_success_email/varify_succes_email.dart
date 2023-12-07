import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/bottom_nav_bar/nav_bar.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VarifyAndSuccessEmail extends StatefulWidget {
  const VarifyAndSuccessEmail({super.key});

  @override
  _VarifyAndSuccessEmailState createState() => _VarifyAndSuccessEmailState();
}

class _VarifyAndSuccessEmailState extends State<VarifyAndSuccessEmail> {
  bool _isShown = true;

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
                height: 200.h,
              ),
              ///Verification Email Image and Airfield
              SvgPicture.asset(
                _isShown
                    ? AppImages.varifyEmailImage
                    : AppImages.varificationImage,
                width: _isShown ? 83.w : 73.w,
                height: 76.h,
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              ///Text 1
              CustomText(
                text: _isShown
                    ? AppLocalizations.of(context)!.emailText1
                    : AppLocalizations.of(context)!.varifyText1,
                style: AppTextStyles.heading1,
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(
                  maxLines: 3,
                  text: _isShown
                      ? AppLocalizations.of(context)!.emailText2
                      : AppLocalizations.of(context)!.verifyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomSizedBox(
                height: _isShown ? 180.h : 190.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.r),
                child: CustomButton(
                  text: _isShown == true
                      ? AppLocalizations.of(context)!.open_your_email
                      : AppLocalizations.of(context)!.start_checking,
                  onPressed: _isShown == true
                      ? () {
                          setState(() {
                            _isShown = !_isShown;
                          });
                        }
                      : () {
                          Get.to(BottomNav());
                        },
                ),
              ),
              CustomSizedBox(
                height: _isShown ? 5.h : 0.h,
              ),
              if (_isShown)
                GestureDetector(
                  onTap: () {
                    Get.to(BottomNav());
                  },
                  child: CustomText(
                    text: AppLocalizations.of(context)!.maybe_later,
                    style: AppTextStyles.fontSize14to400.copyWith(
                      color: AppColors.textColor2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
