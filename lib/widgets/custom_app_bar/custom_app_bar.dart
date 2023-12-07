import 'package:flutter/material.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';

import '../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';


class CustomAppBar extends StatelessWidget {
  IconData leadingIcon;
  String leadingText;
  String trailText;

  CustomAppBar(
      {required this.leadingIcon,
      required this.leadingText,
      required this.trailText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                leadingIcon,
                color: AppColors.textColor,
              ),
            ),
            CustomText(
              text: leadingText,
              style: AppTextStyles.fontSize18to700,
            ),
          ],
        ),
        CustomText(
          text: trailText,
          style: AppTextStyles.fontSize18to700
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
