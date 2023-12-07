import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_button/botton_widget.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

class addCard extends StatefulWidget {
  addCard({super.key});

  @override
  State<addCard> createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  @override
  void dispose() {
    // TODO: implement dispose
    cardNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    pinController.dispose();
    super.dispose();
  }

  TextEditingController cardNameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expiryDateController = TextEditingController();

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
            text: "Card Name",
            style: AppTextStyles.fontSize14to400
                .copyWith(color: AppColors.textColor),
            children: [
              TextSpan(
                  text: "*",
                  style: AppTextStyles.fontSize14to400
                      .copyWith(color: AppColors.bgColor))
            ],
          )),
          SizedBox(
            height: 4,
          ),
          TextField(
            controller: cardNameController,
            cursorColor: AppColors.textColor3,
            style: TextStyle(color: AppColors.textColor),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                isCollapsed: true,
                hintText: "Card Name",
                hintStyle: AppTextStyles.fontSize14to400,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.textColor, width: 0.5)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5))),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text.rich(TextSpan(
            text: "Card Number",
            style: AppTextStyles.fontSize14to400
                .copyWith(color: AppColors.textColor),
            children: [
              TextSpan(
                  text: "*",
                  style: AppTextStyles.fontSize14to400
                      .copyWith(color: AppColors.bgColor))
            ],
          )),
          SizedBox(height: 4.h),
          TextField(
            controller: cardNumberController,
            cursorColor: AppColors.textColor3,
            style: TextStyle(color: AppColors.textColor),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                isCollapsed: true,
                hintText: "2583 3883 8484 8488",
                hintStyle: AppTextStyles.fontSize14to400,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        BorderSide(color: AppColors.textColor, width: 0.5)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.textColor, width: 0.5))),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90.h,
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                      text: "Expiry Date",
                      style: AppTextStyles.fontSize14to400
                          .copyWith(color: AppColors.textColor),
                      children: [
                        TextSpan(
                            text: "*",
                            style: AppTextStyles.fontSize14to400
                                .copyWith(color: AppColors.bgColor))
                      ],
                    )),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextField(
                      controller: expiryDateController,
                      cursorColor: AppColors.textColor3,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          isCollapsed: true,
                          hintText: "12/24",
                          hintStyle: AppTextStyles.fontSize14to400,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColors.textColor, width: 0.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColors.textColor, width: 0.5))),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                height: 90.h,
                width: 150.w,
                decoration: BoxDecoration(color: AppColors.bgColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                      text: "CVC / Cvv",
                      style: AppTextStyles.fontSize14to400
                          .copyWith(color: AppColors.bgColor),
                      children: [
                        TextSpan(
                            text: "*",
                            style: AppTextStyles.fontSize14to400
                                .copyWith(color: AppColors.bgColor))
                      ],
                    )),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextField(
                      controller: pinController,
                      cursorColor: AppColors.textColor3,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          isCollapsed: true,
                          hintText: "*****",
                          hintStyle: AppTextStyles.fontSize14to400,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppColors.textColor, width: 0.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppColors.textColor, width: 0.5))),
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomSizedBox(
            height: 20.h,
          ),
          ButtonWidget(
            height: 50.h,
            width: double.infinity,
            text: "Save",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
