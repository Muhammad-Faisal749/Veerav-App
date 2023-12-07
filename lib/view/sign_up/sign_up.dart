import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/view/varify_success_email/varify_succes_email.dart';
import 'package:swooshed_app/widgets/custom_button/custom_buttons.dart';
import 'package:swooshed_app/widgets/custom_sized_box/custom_sized_box.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_text_form_field/custom_text_field.dart';
import '../not_login/not_login_component/sign_in_component.dart';
import '../not_login/social_component/social_component.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';

  ///Controllers of all Text Form Field
  TextEditingController? nameController = TextEditingController();
  TextEditingController? userNameController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  ///Pick Image object
  XFile? _pickedImage;

  ///Image Picker Method/Function
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  ///If all conditions are valid go to next screen function
  void _onSignUpClick() {
    if (_formKey.currentState!.validate()) {
      // Validation passed, proceed with sign-up logic
      Get.to(VarifyAndSuccessEmail());
    }
  }

  @override

  ///Disposing my all controllers data
  void dispose() {
    passwordController!.dispose();
    emailController!.dispose();
    phoneNumberController!.dispose();
    userNameController!.dispose();
    nameController!.dispose();
    super.dispose();
  }

  ///Data Type Initialization of all Text Form Field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBox(
                      height: 36.h,
                    ),

                    ///Arrow back icon and Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomSizedBox(
                            height: 18.h,
                            width: 16.w,
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        CustomSizedBox(
                          width: 12.w,
                        ),

                        ///Start Checking Now Text
                        CustomSizedBox(
                          width: 300.w,
                          child: CustomText(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            text: AppLocalizations.of(context)!
                                .start_Checking_now,
                            style:
                                AppTextStyles.heading1.copyWith(fontSize: 26),
                          ),
                        ),
                      ],
                    ),

                    ///Sign up to check your items Text
                    Padding(
                      padding: EdgeInsets.only(left: 23.w),
                      child: CustomText(
                        maxLines: 2,
                        text: AppLocalizations.of(context)!
                            .sign_up_to_check_your_items,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.fontSize20to400.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CustomSizedBox(
                      height: 19.h,
                    ),

                    ///Image picker from gallery
                    Center(
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.textColor,
                              ),
                              child: _pickedImage == null
                                  ? Center(
                                      child: SvgPicture.asset(
                                        AppImages.person,
                                        width: 35.w,
                                        height: 32.h,
                                        color: AppColors.bgColor,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.r)),
                                      child: Image.file(
                                        File(_pickedImage!.path),
                                        width: 80.w,
                                        height: 80.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Image.asset(
                                AppImages.imageIcon,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomSizedBox(
                      height: 16.h,
                    ),

                    ///Name Text Form Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.r),
                      child: TextForm(
                        controller: nameController,
                        prefixIcon: SvgPicture.asset(
                          AppImages.nameIcon,
                          color: AppColors.bgColor,
                        ),
                        hintText: AppLocalizations.of(context)!.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.name1;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                    ),
                    CustomSizedBox(
                      height: 16.h,
                    ),

                    ///User Name Text Form Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29),
                      child: TextForm(
                        controller: userNameController,
                        prefixIcon: SvgPicture.asset(
                          AppImages.userNameIcon,
                          color: AppColors.bgColor,
                        ),
                        hintText: AppLocalizations.of(context)!.username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.userName;
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    CustomSizedBox(
                      height: 16.h,
                    ),

                    ///Phone Number Text Form Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.r),
                      child: TextForm(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        prefixIcon: SvgPicture.asset(
                          AppImages.phoneNumberIcon,
                          color: AppColors.bgColor,
                        ),
                        hintText: AppLocalizations.of(context)!.phone_number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.phone;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _phoneNumber = value!;
                        },
                      ),
                    ),
                    CustomSizedBox(
                      height: 16.h,
                    ),

                    ///Email Text Form Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.r),
                      child: TextForm(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: SvgPicture.asset(
                          AppImages.emailAddressIcon,
                          color: AppColors.bgColor,
                        ),
                        hintText: AppLocalizations.of(context)!.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.email1;
                          }

                          final emailPattern =
                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

                          if (!RegExp(emailPattern).hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                    CustomSizedBox(
                      height: 16.h,
                    ),

                    ///Password Text Form Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.w),
                      child: TextForm(
                        controller: passwordController,
                        prefixIcon: SvgPicture.asset(
                          AppImages.userPasswordIcon,
                          color: AppColors.bgColor,
                        ),
                        hintText: AppLocalizations.of(context)!.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.password1;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                    CustomSizedBox(
                      height: 32.h,
                    ),

                    ///SignUp Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.w),
                      child: CustomButton(
                        onPressed: _onSignUpClick,
                        text: AppLocalizations.of(context)!.sign_up,
                      ),
                    ),
                    CustomSizedBox(
                      height: 32.h,
                    ),

                    ///Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.w),
                      child: RowComponent(),
                    ),
                    CustomSizedBox(
                      height: 10.h,
                    ),

                    ///Sign up with google and facebook Logos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///Google Logo
                        SocialComponent(
                          image: AppImages.googleLogo,
                        ),
                        CustomSizedBox(
                          width: 10.w,
                        ),

                        ///Facebook Logo
                        SocialComponent(
                          image: AppImages.facebookLogo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
