import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import '../../utils/app_styles/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_button/botton_widget.dart';
import '../../widgets/custom_text/custom_text.dart';

class BarcodeGenerateScreen extends StatefulWidget {
  const BarcodeGenerateScreen({super.key});

  @override
  State<BarcodeGenerateScreen> createState() => _BarcodeGenerateScreenState();
}

class _BarcodeGenerateScreenState extends State<BarcodeGenerateScreen> {
  String qrData = "Hello, QR Code";
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          CustomSizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomSizedBox(
                      width: 18.w,
                      height: 39.h,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.textColor,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.w, top: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppLocalizations.of(context)!.generateBarCode,
                        style: AppTextStyles.heading1,
                      ),
                      CustomText(
                        text: AppLocalizations.of(context)!.promoCode,
                        style: AppTextStyles.fontSize14to400
                            .copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.h),
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: Container(
                    height: 170.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: AppColors.textColorWhite,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 220.r,
                        gapless: false,
                      ),
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 30.h,
                ),

                ///Text Form Field Bar Code Generator
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: TextField(
                    controller: _textController,
                    style: AppTextStyles.fontSize14to400
                        .copyWith(color: AppColors.bgColor),
                    cursorColor: AppColors.bgColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 25.w),
                      hintText: AppLocalizations.of(context)!.enterHere,
                      prefixIconColor: AppColors.textColor,
                      // hintText: hintText,
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: AppTextStyles.fontSize14to400
                          .copyWith(color: AppColors.bgColor),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (text) {
                      /// Capture the input text
                      qrData = text;
                    },
                  ),
                ),
                SizedBox(height: 20.h),

                ///Generate Bar code text
                ButtonWidget(
                  height: 50.h,
                  width: double.infinity,
                  onTap: () {
                    setState(() {
                      qrData = _textController.text;
                    });
                  },
                  text: AppLocalizations.of(context)!.generateBarCode,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
