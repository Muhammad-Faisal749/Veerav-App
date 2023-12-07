import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../../model/home_categories_model/categories_model.dart';

class CategoriesComponents extends StatelessWidget {
  const CategoriesComponents({super.key});

  @override
  Widget build(BuildContext context) {
 final categoriesData = categoriesDataList(context);
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoriesData.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 120.h, // Increase the mainAxisExtent
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 99.w,
            height: 97.h,

            // padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.textColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.bgColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),

                ),
              ],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  // padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 24.h),
                  padding:  EdgeInsets.only(top: 7.h,bottom: 5.h),
                  child: Container(
                    width: 50.w,
                    height: 50.h,

                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.bgColor.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),

                          ),
                        ],
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.textColor,

                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        categoriesData[index].img.toString(),
                        width: categoriesData[index].imageWidth,
                        height: categoriesData[index].imageHeight,
                        // ignore: deprecated_member_use
                        color: AppColors.bgColor,
                      ),
                    ),
                  ),
                ),
                // CustomSizedBox(height: 5.h),
                CustomText(
                  text: categoriesData[index].text.toString(),
                  style: AppTextStyles.fontSize14to700.copyWith(
                    fontSize: 12,
                    color: AppColors.bgColor,
                    // maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Add ellipsis for long text
                )
              ],
            ),
          );
        },
      ),
    );
  }

}
