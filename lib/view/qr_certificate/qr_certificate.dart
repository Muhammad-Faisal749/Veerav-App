import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/view/profile/components/profile_header_widget.dart';
import 'package:swooshed_app/view/qr_certificate/qr_cerificate_header.dart';
import 'package:swooshed_app/widgets/custom_button/botton_widget.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:swooshed_app/widgets/gallery_widget/gallery_section.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import '../details_e_result/components/brands.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QrCertificate extends StatefulWidget {
  const QrCertificate({super.key});

  @override
  State<QrCertificate> createState() => _QrCertificateState();
}

class _QrCertificateState extends State<QrCertificate> {
  int clickCount = 0;
  void changeImage() {
    if (clickCount < 3) {
      setState(() {
        clickCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              // Get.back();
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.r, top: 60.r),
              child: Image.asset(
                AppImages.profileBackArrow,
                height: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QrCertificateHeader(
                  img: clickCount == 2
                      ? Image.asset(AppImages.yourauthenticationApproveIcon,
                          height: 70)
                      : clickCount == 3
                          ? Image.asset(AppImages.yourauthenticationApproveIcon,
                              height: 70)
                          : Container(
                              width: 70,
                              height: 70,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: AppColors.redColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(375),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 15,
                                    offset: Offset(0, 15),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImages.yourauthenticationFalseIcon,
                                  height: 30.h,
                                ),
                              ),
                            ),
                  text: clickCount == 3
                      ? ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                Color(0xFFE007CF),
                                Color(0x1A35FB).withOpacity(0.8)
                              ],
                              stops: [0.0, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.authentic,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Color(0xFFE007CF), // The initial text color
                              fontSize: 16.sp,
                              fontFamily: Appfonts.sfPro,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        )
                      : clickCount == 2
                          ? ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    Color(0xFFE007CF),
                                    Color(0x1A35FB).withOpacity(0.8)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.authentic,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white, // The initial text color
                                  fontSize: 16.sp,
                                  fontFamily: Appfonts.sfPro,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            )
                          : Text(
                    AppLocalizations.of(context)!.fake,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontSize: 16.sp,
                                fontFamily: Appfonts.sfPro,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.08,
                              ),
                            ),
                ),
                CustomSizedBox(
                  height: 10,
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.brand,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.35,
                  ),
                ),
                CustomSizedBox(
                  height: 10.h,
                ),
                BrandsComponentDetails(),
                CustomSizedBox(
                  height: 10.h,
                ),
                Text(
                  AppLocalizations.of(context)!.gallery,
                  style: TextStyle(
                    color: AppColors.textColorWhite,
                    fontSize: 14.sp,
                    fontFamily: Appfonts.sfPro,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 300.h, child: const GallerySection()),
                CustomSizedBox(
                  height: 15.h,
                ),
                ProfileHeaderWidget(),
                CustomSizedBox(
                  height: 15.h,
                ),
                Container(
                  child: clickCount == 1
                      ? null
                      : clickCount == 3
                          ? null
                          : ButtonWidget(
                              height: 40,
                              text: AppLocalizations.of(context)!.saveCertificate,
                              width: double.infinity,
                              onTap: () {},
                            ),
                ),
                CustomSizedBox(
                  height: 9.h,
                ),
                ButtonWidget(
                  height: 40,
                  text: clickCount == 1
                      ? AppLocalizations.of(context)!.print
                      : clickCount == 3
                          ? AppLocalizations.of(context)!.printP
                          : AppLocalizations.of(context)!.printCertificate,
                  width: double.infinity,
                  onTap: () {
                    changeImage();
                  },
                ),
                CustomSizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
