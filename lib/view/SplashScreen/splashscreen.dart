import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/view/home/home.dart';

import '../bottom_nav_bar/nav_bar.dart';
import '../choose_language/choose_language.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    AppTexts.userToken = sp.getString(AppTexts.tokenKey) ?? "";
    if (AppTexts.userToken.isNotEmpty) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ChooseLanguageScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Image.asset(
          AppImages.appSplashlogo,
          height: 220.h,
        ),
      ),
    );
  }
}
