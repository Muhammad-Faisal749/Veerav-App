import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/home_check_result_model/check_result.dart';

class CheckResultsComponents extends StatelessWidget {
  const CheckResultsComponents({super.key});
///Check Results Component
  @override
  Widget build(BuildContext context) {
    final myCheckResultData = myCheckResultDataList(context);
    return SizedBox(
      height: 550.h,
      child: GridView.builder(
        clipBehavior: Clip.none,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myCheckResultData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisExtent: 180.h,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            ///Check Result Bg Image
            child: Container(
                height: 180.h,
                width: 160.w,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                        image: AssetImage(
                            myCheckResultData[index].bgImage.toString()),

                        fit: BoxFit.cover)),
                ///Stack Color above bg image
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      height: 83.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // image: DecorationImage(image: AssetImage("assets/images/png_images/back.png"))
                          gradient: AppColors.textGradient,
                          // color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r))),

                      ///Above Stack
                      child: Stack(
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 14.h, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Text 1
                                CustomText(

                                  text: myCheckResultData[index].toString(),
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.fontSize10to500.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                                ///Text 2
                                CustomText(

                                    text: myCheckResultData[index].text2.toString(),
                                    style: AppTextStyles.fontSize14to700.copyWith(
                                     overflow: TextOverflow.ellipsis,
                                      color: AppColors.textColor
                                    )),


                                SizedBox(
                                  height: 6.h,
                                ),
                                ///Row Divider
                                CustomSizedBox(
                                  width: double.infinity,
                                  child: Divider(
                                    height: 1.h,
                                    color: AppColors.btnBgColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                ///Text 3
                                CustomText(
                                  text: AppLocalizations.of(context)!
                                      .checked_April_2022,
                                  style: AppTextStyles.fontSize10to500.copyWith(
                                      fontWeight: FontWeight.w400, fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: -10.h,
                              // bottom: 70.h,
                              right: 10.w,
                              child: Image.asset(
                                myCheckResultData[index].image.toString(),
                                width: 24.w,
                                height: 24.h,
                              ))
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
