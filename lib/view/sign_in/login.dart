import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swooshed_app/controller/loginProvider/login_provider.dart';

import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/bottom_nav_bar/nav_bar.dart';
import 'package:swooshed_app/view/home/home.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/signin_with_google/signin_with_google.dart';
import '../../widgets/custom_text_form_field/custom_text_field.dart';
import '../not_login/not_login_component/sign_in_component.dart';
import '../not_login/social_component/social_component.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///Form Key Object
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///Objects for my Text Form Field Controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///Disposing my controller data
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _username = '';
  String _password = '';

  String? _usernameErrorText;
  String? _passwordErrorText;

  void _validateForm() {
    _usernameErrorText = null;
    _passwordErrorText = null;

    if (_formKey.currentState!.validate()) {
      // Validation passed, proceed with signing in

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LoginProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSizedBox(
                    height: 90.h,
                  ),

                  ///App Logo Image
                  Image.asset(
                    AppImages.appIconPng,
                    width: 100.w,
                    height: 90.h,
                  ),

                  ///Welcome Back Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: AppLocalizations.of(context)!.welcome_back,
                      style: AppTextStyles.heading1,
                    ),
                  ),

                  ///Sign in to check your items Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomText(
                      text: AppLocalizations.of(context)!.sign_in_to,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.fontSize17to600
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  CustomSizedBox(
                    height: 32.h,
                  ),

                  ///User Name Text Form Field
                  TextForm(
                    onSaved: (value) => _username = value ?? '',
                    controller: _usernameController,
                    prefixIcon: SvgPicture.asset(AppImages.userNameIcon,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                    hintText: AppLocalizations.of(context)!.username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.userName;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _usernameErrorText = null;
                      });
                    },
                  ),

                  ///Showing User Text Error when Text Form Field is empty
                  if (_usernameErrorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _usernameErrorText!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  CustomSizedBox(
                    height: 16.h,
                  ),

                  ///Password Text Form Field
                  TextForm(
                    onSaved: (value) => _password = value ?? '',
                    controller: _passwordController,
                    prefixIcon: SvgPicture.asset(AppImages.userPasswordIcon,
                        color: AppColors.bgColor),
                    hintText: AppLocalizations.of(context)!.password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.password1;
                      }
                      if (value.length < 8) {
                        return AppLocalizations.of(context)!.passwordMust;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _passwordErrorText = null;
                      });
                    },
                  ),

                  ///Showing User Password Text Error when Text Form Field is empty
                  if (_passwordErrorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _passwordErrorText!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  CustomSizedBox(
                    height: 32.h,
                  ),

                  ///Sign in button
                  Consumer<LoginProvider>(
                    builder: (context, getLoginProvider, child) {
                      return CustomButton(
                        // _validateForm
                        onPressed: () {
                          _validateForm();
                          getLoginProvider.getLoginMethod(
                              email: _usernameController.text.trim(),
                              password: _passwordController.text.trim());
                        },
                        loading: getLoginProvider.isLoading,
                        text: AppLocalizations.of(context)!.sign_in,
                      );
                    },
                  ),
                  CustomSizedBox(
                    height: 32.h,
                  ),

                  ///Login with facebook and google
                  RowComponent(),
                  CustomSizedBox(
                    height: 10.h,
                  ),

                  ///Login with facebook and google Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///google Image
                      SocialComponent(
                        onTap: () {
                          Provider.of<SocialMediaLoginProvider>(context,
                                  listen: false)
                              .signInWithGoogle(
                                  context: context, authType: "GOOGLE");
                        },
                        image: AppImages.googleLogo,
                      ),
                      CustomSizedBox(
                        width: 10.h,
                      ),

                      ///facebook Image
                      SocialComponent(
                        onTap: () {},
                        image: AppImages.facebookLogo,
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: 19.h,
                  ),

                  ///Don’t have an account
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/SignUpScreen');
                      },
                      child: CustomText(
                          text:
                              AppLocalizations.of(context)!.dont_have_account)),

                  CustomSizedBox(height: 5.h),

                  ///Sign Up Button

                  CustomSizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/SignUpScreen');
                    },
                    child: CustomText(
                      text: AppLocalizations.of(context)!.sign_up,
                      style: AppTextStyles.fontSize14to400.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
