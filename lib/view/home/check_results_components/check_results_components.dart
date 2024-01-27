import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/controller/check_result_provider/check_result_provider.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/home_check_result_model/check_result.dart';

class CheckResultsComponents extends StatefulWidget {
  const CheckResultsComponents({super.key});

  @override
  State<CheckResultsComponents> createState() => _CheckResultsComponentsState();
}

class _CheckResultsComponentsState extends State<CheckResultsComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CheckResultProvider>(context, listen: false).CheckResultApi();
  }

  ///Check Results Component
  @override
  Widget build(BuildContext context) {
    final myCheckResultData = myCheckResultDataList(context);
    return Consumer<CheckResultProvider>(
      builder: (context, checkResultProvider, child) {
        return checkResultProvider.checkResultList.length == 0
            ? checkResultProvider.checkResultList[0].order != null
                ? SizedBox(
                    height: 550.h,
                    child: GridView.builder(
                      clipBehavior: Clip.none,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          checkResultProvider.checkResultList[0].order!.length,
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
                                      image: NetworkImage(
                                          // myCheckResultData[index].bgImage.toString()),
                                          AppUrls.imageUrl +
                                              checkResultProvider
                                                  .checkResultList[0]
                                                  .order![index]
                                                  .product!
                                                  .appearance
                                                  .toString()),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ///Text 1
                                              CustomText(
                                                text: checkResultProvider
                                                    .checkResultList[0]
                                                    .order![index]
                                                    .product!
                                                    .note
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                style: AppTextStyles
                                                    .fontSize10to500
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10),
                                              ),

                                              ///Text 2
                                              CustomText(
                                                  text: checkResultProvider
                                                      .checkResultList[0]
                                                      .order![index]
                                                      .product!
                                                      .name
                                                      .toString(),
                                                  style: AppTextStyles
                                                      .fontSize14to700
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: AppColors
                                                              .textColor)),

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
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .checked_April_2022,
                                                style: AppTextStyles
                                                    .fontSize10to500
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            top: -10.h,
                                            // bottom: 70.h,
                                            right: 10.w,
                                            child: Image.asset(
                                              checkResultProvider
                                                          .checkResultList[0]
                                                          .order![index]
                                                          .productStatus ==
                                                      'AUTHENTIC'
                                                  ? AppImages.tickLogo
                                                  : AppImages.crossLogo,
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
                  )
                : AppTexts.spinKitCircle()
            : Center(
                child: Text(
                  "NO data Found",
                  style: TextStyle(color: Colors.white),
                ),
              );
      },
    );
  }
}
