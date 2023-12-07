import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImage extends StatelessWidget {
  String imgUrl;
  double? height;
  double? width;
  BoxFit? fit;
  Color? color;

  CustomImage(
      {required this.imgUrl, this.height, this.width, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgUrl,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }
}
