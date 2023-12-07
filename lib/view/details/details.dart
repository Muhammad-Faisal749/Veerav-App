import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/brand/brand.dart';
import 'package:swooshed_app/view/category_two/category_two.dart';
import 'package:swooshed_app/view/camera/my_camera.dart';
import 'package:swooshed_app/view/payment_method/payment_method.dart';
import 'package:swooshed_app/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_container/custom_container.dart';
import 'package:swooshed_app/widgets/custom_image/custom_image.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:swooshed_app/widgets/custom_text_form_field/custom_text_field.dart';
import '../../Model/detail_model/detail_model.dart';
import '../../main.dart';
import '../../utils/app_colors/app_colors.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final detailsList = detailList(context);

    ///Showing my data length
    print("data are ${AppTexts.imagesfiles.length}");
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(Brand());
                  // Navigator.pop(context);
                },
                child: CustomAppBar(
                    leadingIcon: Icons.arrow_back_ios_new,
                    leadingText: AppLocalizations.of(context)!.step_3,
                    trailText: ''),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppLocalizations.of(context)!.item_details,
                      style: AppTextStyles.heading1,
                    ),
                    SizedBox(height: 24.h),
                    TextForm(
                      hintText: AppLocalizations.of(context)!.product,
                      prefixIcon: CustomImage(
                        imgUrl: AppImages.product_name,
                        color: AppColors.bgColor,
                        width: 20.w,
                        height: 19.h,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextForm(
                      hintText: AppLocalizations.of(context)!.notes,
                      prefixIcon: CustomImage(
                        imgUrl: AppImages.notes,
                        color: AppColors.bgColor,
                        width: 20.w,
                        height: 19.h,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: AppLocalizations.of(context)!.images,
                          style: AppTextStyles.fontSize14to400
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => CategoryTwo());
                              },
                              child: Image.asset(
                                AppImages.itemsDetailsQuestionMark,
                                height: 18,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 245.h,
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            detailsList.length >= 8 ? 8 : detailsList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 120.h,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(CameraScreen(cameras));
                            },
                            child: Column(
                              children: [
                                index < AppTexts.imagesfiles.length
                                    ? Container(
                                        height: 98.w,
                                        width: 98.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.textColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: InkWell(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.file(
                                                File(
                                                  AppTexts.imagesfiles[
                                                          index]! ??
                                                      "",
                                                ),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      )
                                    : Container(
                                        height: 98.w,
                                        width: 98.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.textColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: InkWell(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: Center(
                                                child: Image.asset(
                                              detailsList[index].imgUrl,
                                              width: 40.w,
                                              height: 33.h,
                                              color: AppColors.bgColor,
                                            )),
                                          ),
                                        ),
                                      ),
                                CustomSizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: detailsList[index].text,
                                  style: AppTextStyles.fontSize14to400.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.35,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomContainer(
        height: 50.h,
        borderRadius: BorderRadius.circular(4.r),
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: CustomButton(
          text: AppLocalizations.of(context)!.next,
          onPressed: () {
            Get.to(
              PaymentMethod2(),
            );
          },
        ),
      ),
    );
  }
}
