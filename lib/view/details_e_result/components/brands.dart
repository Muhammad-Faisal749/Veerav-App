import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BrandsComponentDetails extends StatelessWidget {
  const BrandsComponentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.all(16.r),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColors.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
      child: Row(children: [
        Container(
          width: 32,
          height: 32,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.textColorWhite,
            // gradient: LinearGradient(
            //   begin: Alignment(0.94, -0.35),
            //   end: Alignment(-0.94, 0.35),
            //   colors: [Color(0xFFE007CF), Color(0xFF1A35FB)],
            // ),
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                offset: Offset(0, 2), // Shadow offset
                blurRadius: 4, // Shadow blur radius
              ),
            ],

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Center(
            child: Image.asset(
              AppImages.ypurauthenticationgalleypicturelogo,
              color: Colors.black,
              height: 15,
            ),
          ),
        ),
        CustomSizedBox(
          width: 10.h,
        ),
        CustomText(
          text: AppLocalizations.of(context)!.louis,
          style: TextStyle(
            color: AppColors.bgColor,
            fontSize: 12.sp,
            fontFamily: Appfonts.sfPro,
            fontWeight: FontWeight.w700,
            height: 0.14,
            letterSpacing: -0.24,
          ),
        )
      ]),
    );
  }
}
