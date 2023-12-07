import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/view/sign_in/login.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import '../../../utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderAuthentication extends StatelessWidget {
  final Widget text;
  final Widget img;

  const HeaderAuthentication({
    super.key,
    required this.text,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.yourauthenticationBgPic),
              // Replace with your image asset path
              fit: BoxFit.fill, // You can adjust the fit as needed
            ),
          ),
        ),
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              stops: [0.0, 0.7], // You can adjust the stops as needed
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 20.h,
              margin: EdgeInsets.only(top: 50.r),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      AppImages.profileBackArrow,
                      height: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(LoginScreen());
                    },
                    child: Image.asset(
                      AppImages.yourauthenticationCartIcon,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            CustomSizedBox(
              height: 20,
            ),
            img,
            CustomSizedBox(
              height: 13,
            ),
            text,
            CustomSizedBox(
              height: 12.h,
            ),
            Text(
              AppLocalizations.of(context)!.fashion,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColorGrey,
                fontSize: 12,
                fontFamily: Appfonts.sfPro,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.louis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColorWhite,
                fontSize: 16,
                fontFamily: Appfonts.sfPro,
                fontWeight: FontWeight.w700,
              ),
            ),
            CustomSizedBox(
              height: 2.h,
            ),
            Text(
              AppLocalizations.of(context)!.auth,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColorWhite,
                fontSize: 10,
                fontFamily: Appfonts.sfPro,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Text(
              AppLocalizations.of(context)!.apr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColorWhite,
                fontSize: 10,
                fontFamily: Appfonts.sfPro,
                fontWeight: FontWeight.w400,
                height: 0.39,
              ),
            ),
            CustomSizedBox(
              height: 20.h,
            ),
          ]),
        ),
      ],
    );
  }
}
