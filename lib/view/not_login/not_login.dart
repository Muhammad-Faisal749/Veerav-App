import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../sign_in/login.dart';

class NotLoginScreen extends StatelessWidget {
  const NotLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSizedBox(
                height: 200.h,
              ),
              SvgPicture.asset(
                AppImages.person,
                width: 75.w,
                height: 70.h,
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(
                  maxLines: 2,
                    textAlign: TextAlign.center,
                    text: AppLocalizations.of(context)!.we_Didnt_Recognize_You,
                    style: AppTextStyles.heading1),
              ),
              CustomSizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(
                  maxLines: 2,
                  text: AppLocalizations.of(context)!.signIn,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomSizedBox(
                height: 150.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: CustomButton(
                  onPressed: () {
                    // Get.to( const LoginScreen());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen(),
                        ));
                  },
                  text: AppLocalizations.of(context)!.sign_in,
                ),
              ),
              CustomSizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
