import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import '../../utils/app_styles/app_text_styles.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  String? hintText;
  Widget? prefixIcon;
  void Function(String)? onChanged;
  TextEditingController? controller;
  String? Function(String?)? validator; // Validator function
  void Function(String?)? onSaved;
  TextInputType? keyboardType;

  TextForm(
      {this.hintText,
        this.prefixIcon,
        this.controller,
        this.onChanged,
        this.validator, // Validator function
        this.onSaved,
        this.keyboardType,
        super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: TextFormField(
        style: AppTextStyles.fontSize14to400.copyWith(color: AppColors.bgColor),
        cursorColor: AppColors.bgColor,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(14.r),
            child: prefixIcon,
          ),
          prefixIconColor: AppColors.textColor,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          hintStyle: AppTextStyles.fontSize14to400.copyWith(color: AppColors.bgColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
