import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/view/details_e_result/components/brands.dart';
import 'package:swooshed_app/view/details_e_result/components/details_header.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:swooshed_app/widgets/gallery_widget/gallery_section.dart';
import '../../utils/app_fonts/app_fonts.dart';

class DetaileResults extends StatefulWidget {
  const DetaileResults({super.key});

  @override
  State<DetaileResults> createState() => _DetaileResultsState();
}

class _DetaileResultsState extends State<DetaileResults> {
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
        child: Column(children: [
          DetaildHeader(
              text: clickCount == 0
                  ? Text(
                      'Insufictient Photos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFD56C),
                        fontSize: 16.sp,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.08,
                      ),
                    )
                  : clickCount == 1
                      ? Text(
                          'Indefinable',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 16.sp,
                            fontFamily: Appfonts.sfPro,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.08,
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
                                'Authentic',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(
                                      0xFFE007CF), // The initial text color
                                  fontSize: 16.sp,
                                  fontFamily: Appfonts.sfPro,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            )
                          : Text(
                              'Fake',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontSize: 16.sp,
                                fontFamily: Appfonts.sfPro,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.08,
                              ),
                            ),
              img: clickCount == 0
                  ? Image.asset(AppImages.detaileResultPhotosInsufficeint,
                      height: 60)
                  : clickCount == 1
                      ? Image.asset(AppImages.detaileResultRedblueQuestion,
                          height: 70)
                      : clickCount == 2
                          ? Image.asset(AppImages.yourauthenticationApproveIcon,
                              height: 70)
                          : Image.asset(AppImages.detaileResultRedFalse,
                              height: 70)),
          CustomSizedBox(
            height: 15.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  changeImage();
                },
                child: CustomText(
                  text: "Brands",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: Appfonts.sfPro,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.35,
                  ),
                ),
              ),
              CustomSizedBox(
                height: 5.h,
              ),
              BrandsComponentDetails(),
              CustomSizedBox(
                height: 10.h,
              ),
              CustomText(
                text: "Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: Appfonts.sfPro,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.35,
                ),
              ),
              GallerySection()
            ]),
          )
        ]),
      ),
    );
  }
}
