import 'package:flutter/material.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextStyle style;
  final TextAlign textAlign;
  int? maxLines;

  CustomText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.center,
        this.maxLines,
      this.style = AppTextStyles.fontSize14to400});

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      maxLines:maxLines ,
      style: style,
      textAlign: textAlign,
    );
  }
}
