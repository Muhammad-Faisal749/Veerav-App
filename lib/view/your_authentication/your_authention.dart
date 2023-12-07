import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_fonts/app_fonts.dart';
import 'package:swooshed_app/widgets/custom_button/botton_widget.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_images/app_images.dart';
import 'components/components.dart';
import '../../widgets/gallery_widget/gallery_section.dart';

class YourAuthenticationScreen extends StatefulWidget {
  const YourAuthenticationScreen({super.key});

  @override
  State<YourAuthenticationScreen> createState() =>
      _YourAuthenticationScreenState();
}

class _YourAuthenticationScreenState extends State<YourAuthenticationScreen> {
  int clickCount = 0;
  void changeImage() {
    if (clickCount < 2) {
      setState(() {
        clickCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(children: [
        HeaderAuthentication(
            text: clickCount == 0
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
                        color: Color(0xFFE007CF), // The initial text color
                        fontSize: 16,
                        fontFamily: Appfonts.sfPro,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  )
                : Text(
                    clickCount == 1
                        ? AppLocalizations.of(context)!.fake
                        : AppLocalizations.of(context)!.inde,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: clickCount == 1
                          ? AppColors.redColor
                          : AppColors.blueColor,
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.08,
                    ),
                  ),
            img: clickCount == 0
                ? Image.asset(AppImages.yourauthenticationApproveIcon,
                    height: 70)
                : Container(
                    width: 70,
                    height: 70,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: clickCount == 1
                          ? AppColors.redColor
                          : AppColors.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(375),
                      ),
                      shadows: [
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
                        clickCount == 1
                            ? AppImages.yourauthenticationFalseIcon
                            : AppImages.yourauthenticationIndefinableIcon,
                        height: 30,
                      ),
                    ),
                  )),
        CustomSizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.gallery,
                style: TextStyle(
                  color: AppColors.textColorWhite,
                  fontSize: 14,
                  fontFamily: Appfonts.sfPro,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomSizedBox(
                height: 5.h,
              ),
              const GallerySection(),
              Container(
                // margin: EdgeInsets.only(bottom: 10),
                child: clickCount == 2
                    ? null
                    : ButtonWidget(
                        onTap: () {
                          changeImage();
                        },
                        height: 50.h,
                        width: double.infinity,
                        text: AppLocalizations.of(context)!.sc,
                      ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}