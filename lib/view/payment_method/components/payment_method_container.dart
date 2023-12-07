import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/custom_container/custom_container.dart';
import '../../../widgets/custom_image/custom_image.dart';
import '../../../widgets/custom_text/custom_text.dart';

// ignore: must_be_immutable
class PaymentMethodContainer extends StatelessWidget {
  String title;
  String imgUrl;
  IconData? icon;
  double? width;
  double ?height;

  PaymentMethodContainer(
      {required this.imgUrl, required this.title, this.icon,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      width: MediaQuery.of(context).size.width,
      // gradient: AppColors.mediumGradient,
      color: AppColors.textColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        children: [
          icon == null
              ? CustomImage(
                  imgUrl: imgUrl,
            width: width,
            height: height,
                )
              : Icon(
                  icon,
                  color: AppColors.bgColor,

                ),
          SizedBox(width: 16.w),
          CustomText(
            text: title,
            style: AppTextStyles.fontSize14to400
                .copyWith(fontWeight: FontWeight.w500,color: AppColors.bgColor),
          ),
        ],
      ),
    );
  }
}
