import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/get_started/get_started.dart';
import 'package:swooshed_app/view/home/home.dart';
import 'package:swooshed_app/view/profile/profile_screen.dart';
import 'package:swooshed_app/view/wallet/wallet.dart';

import '../history/history.dart';

class BottomNav extends StatefulWidget {
  BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      WalletScreen(),
      GetStarted(),
      HistoryScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 20,
        inactiveIcon: Transform.scale(
          scale: 2.5.r,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppImages.bottomNavhome,
              color: Colors.grey,
            ),
          ),
        ),
        icon: Transform.scale(
          scale: 2.5.r,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppImages.bottomNavhome,
              // color: Colors.grey,
            ),
          ),
        ),
        title: AppLocalizations.of(context)!.home,
        textStyle: AppTextStyles.bottomNavStyle,
        activeColorPrimary: AppColors.textColorWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 25,
        icon: Transform.scale(
          scale: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(AppImages.bottomNavWallet,
                color: Colors.white),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppImages.bottomNavWallet,
            ),
          ),
        ),
        title: AppLocalizations.of(context)!.wallet,
        textStyle: AppTextStyles.bottomNavStyle,
        activeColorPrimary: AppColors.textColorWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,

        // iconSize: 30,
        icon: Transform.scale(
          scale: 1.25,
          child: Container(
            width: 45.w,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColors.textColorWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: Transform.scale(
                scale: 1,
                child: SvgPicture.asset(
                  AppImages.bottomNavSearch,
                  color: AppColors.bgColor,
                ),
              ),
            ),
          ),
        ),
        title: AppLocalizations.of(context)!.authenticate,
        textStyle: AppTextStyles.bottomNavStyle,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(AppImages.bottomNavHistory,
                color: Colors.white),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppImages.bottomNavHistory,
            ),
          ),
        ),
        title: AppLocalizations.of(context)!.history,
        textStyle: AppTextStyles.bottomNavStyle,
        activeColorPrimary: AppColors.textColorWhite,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(AppImages.bottomNavProfile,
                // ignore: deprecated_member_use
                color: Colors.white),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppImages.bottomNavProfile,
            ),
          ),
        ),
        title: AppLocalizations.of(context)!.profile,
        textStyle: AppTextStyles.bottomNavStyle,
        activeColorPrimary: AppColors.textColorWhite,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.bgColor,

      handleAndroidBackButtonPress: true,

      resizeToAvoidBottomInset: true,

      stateManagement: true,

      hideNavigationBarWhenKeyboardShows: true,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.r),
        colorBehindNavBar: Colors.white,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, //
    );
  }
}
