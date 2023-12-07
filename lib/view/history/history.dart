import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/Model/history_model/history_model.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/view/your_authentication/your_authention.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final historyDetails = historyDetailsList(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Container(
              height: 600.h,
              margin: EdgeInsets.only(top: 50.r),
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: historyDetails.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const YourAuthenticationScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.r),
                      padding: EdgeInsets.all(16.r),
                      decoration: ShapeDecoration(
                        color: AppColors.textColorWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: AppColors.textColorWhite,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0,
                                  ),
                                ],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r)),
                              ),
                              child: Center(
                                  child: Image.asset(
                                historyDetails[index].iconPath,
                                height: 16.h,
                              )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  historyDetails[index].title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: historyDetails[index].title ==
                                            "Authentic"
                                        ? const Color(0xFF3BFF72)
                                        : historyDetails[index].title == "Fake"
                                            ? const Color(0xFFFF554C)
                                            : const Color(0xFFFFD56C),
                                    fontSize: 10.sp,
                                    fontFamily: Appfonts.sfPro,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.08,
                                  ),
                                ),
                                CustomSizedBox(
                                  height: 5.w,
                                ),
                                SizedBox(
                                  width: 215.w,
                                  child: Text(
                                    historyDetails[index].subtitle,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 12,
                                      fontFamily: Appfonts.sfPro,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.24,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
