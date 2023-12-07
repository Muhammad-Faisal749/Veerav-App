import 'package:flutter/material.dart';
import '../../utils/app_colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget child;
  Gradient? gradient;

  CustomContainer({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.color = AppColors.textColor,
    this.borderRadius,
    this.borderColor,
    required this.child,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(

        color: color,
        borderRadius: borderRadius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
