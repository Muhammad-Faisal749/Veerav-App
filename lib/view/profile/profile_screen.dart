import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/profile/about_us/about_us.dart';
import 'package:swooshed_app/view/profile/components/language_screen_select.dart';
import 'package:swooshed_app/view/profile/components/row_widget.dart';
import 'package:swooshed_app/view/profile/contact_us/contact_us.dart';
import 'package:swooshed_app/view/profile/faq_screen/faq_screen.dart';
import 'package:swooshed_app/view/profile/setting/setting_screen.dart';
import 'package:swooshed_app/view/profile/share_app/share_app.dart';
import 'package:swooshed_app/view/sign_in/login.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'components/profile_header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'invite_friends/invite_friends.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: 780.h,
          padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 68.r),
          child: Column(children: [
            const ProfileHeaderWidget(),
            SizedBox(
              height: 24.h,
            ),
            Column(
              children: [
                RowWidget(
                  ontap: () {
                    Get.to(() => InviteFriendScreen());
                  },
                  preffix: AppImages.profileInviteFriend,
                  text: AppLocalizations.of(context)!.invite_friends,
                ),
                SizedBox(
                  height: 8.h,
                ),
                RowWidget(
                  ontap: () {
                    Get.to(() => ShareAppScreen());
                  },
                  preffix: AppImages.profileShareApp,
                  text: AppLocalizations.of(context)!.share_vereev_app,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Column(
                  children: [
                    RowWidget(
                      ontap: () {
                        Get.to(() => AboutUsScreen());
                      },
                      preffix: AppImages.profileAboutUs,
                      text: AppLocalizations.of(context)!.about_us,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    RowWidget(
                      ontap: () {
                        Get.to(() => ContactUsScreen());
                      },
                      preffix: AppImages.profileContactUs,
                      text: AppLocalizations.of(context)!.contact_us,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    RowWidget(
                      ontap: () {
                        Get.to(() => FAQScreen());
                      },
                      preffix: AppImages.profileFAQ,
                      text: AppLocalizations.of(context)!.faq,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Column(
                  children: [
                    RowWidget(
                      ontap: () {
                        Get.to(() => const ChooseLanguagePofile());
                      },
                      preffix: AppImages.profileLanguages,
                      text: AppLocalizations.of(context)!.language,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    RowWidget(
                      ontap: () {
                        Get.to(() => SettingScreen());
                      },
                      preffix: AppImages.profileSetting,
                      text: AppLocalizations.of(context)!.setting,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                 GestureDetector(
                   onTap: () async{
                     SharedPreferences sp = await SharedPreferences.getInstance();
                     // sp.getString(AppTexts.userToken);
                     sp.remove(AppTexts.tokenKey);
                     Get.to(()=>LoginScreen());
                   },
                   child: Container(
                     width: double.infinity,
                     height: 46.h,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(left: 15),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Icon(Icons.logout,size: 25,),
                           SizedBox(width: 10,),
                           CustomText(text: "Logout",style: AppTextStyles.fontSize14to700,)
                         ],
                       ),
                     ),
                   ),
                 )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
