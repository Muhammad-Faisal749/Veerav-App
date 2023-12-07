import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/Model/translation_model/translation_model.dart';
import 'package:swooshed_app/controller/translation_controller/translation_controller.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/model/choose_languages_model/choose_language.dart';

import '../../../utils/app_images/app_images.dart';
import '../../../widgets/custom_text/custom_text.dart';

class ChooseLanguagePofile extends StatefulWidget {
  const ChooseLanguagePofile({Key? key}) : super(key: key);

  @override
  State<ChooseLanguagePofile> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguagePofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox(
                height: 30.h,
              ),
              ///Back Button
              Padding(
                padding:  EdgeInsets.only(left: 7.w,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Image.asset(
                          AppImages.profileBackArrow,
                          height: 18.h,
                          width: 25.w,
                        ),
                      ),
                    ),
                    ///Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ///Language Text
                        CustomText(
                          textAlign: TextAlign.start,
                          text: AppLocalizations.of(context)!.language,
                          style: AppTextStyles.heading1,
                        ),
                        ///Choose your language Text
                        SizedBox(
                          width: 300.w,
                          child: CustomText(
                            textAlign: TextAlign.start,
                              maxLines: 2,
                              text: AppLocalizations.of(context)!
                                  .choose_your_language_preferences,
                              style: AppTextStyles.fontSize14to400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                height: 32.h,
              ),

              ///List View Builder
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: languageLists.length,
                  itemBuilder: (context, index) {
                    return Consumer<LanguageChangeController>(
                        builder: (context, Provider, child) {
                      return GestureDetector(
                        onTap: () {
                          Provider.setCurrent(index);
                          Provider.changeLanguage(
                              Locale(TranslationList[index].languageName));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.r),
                          child: Container(
                            // width: 326,
                            height: 48.h,
                            // color: AppColors.textColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 14.h),
                            margin: EdgeInsets.only(bottom: 8.r),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Provider.current == index
                                  ? AppColors.textColorGrey
                                  : AppColors.textColor,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  languageLists[index].flagName,
                                  height: 22.h,
                                  width: 18.w,
                                ),
                                CustomSizedBox(width: 10),
                                CustomText(
                                    text: languageLists[index].languageName,
                                    style: AppTextStyles.fontSize14to400.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.bgColor)),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              CustomSizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
