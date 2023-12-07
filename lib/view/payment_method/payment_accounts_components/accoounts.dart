import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_styles/app_text_styles.dart';
import '../../../widgets/custom_sized_box/custom_sized_box.dart';
import '../../../widgets/custom_text/custom_text.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String text;
  final String? image;
  final IconData? icon;

  const PaymentMethodContainer(
      {super.key, required this.text, this.image, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null)
            Image.asset(
              image!,
              width: 24.w,
              height: 24.h,
              color: AppColors.bgColor,
            )
          else if (icon != null)
            CustomSizedBox(
              height: 23.h,
              width: 15.w,
              child: Icon(
                icon,
                // color: AppColors.bgColor,
              ),
            ),
          SizedBox(
            width: 220.w,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: CustomText(
                text: text,
    textAlign: TextAlign.start,
    style: AppTextStyles.fontSize14to700
        .copyWith(fontWeight: FontWeight.w500,color: AppColors.bgColor),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
