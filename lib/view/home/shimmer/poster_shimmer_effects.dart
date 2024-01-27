import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PageViewShimmerEffect extends StatelessWidget {
  const PageViewShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
            width: 200.w,
            decoration: BoxDecoration(
              // gradient: AppColors.textGradient,
              image: DecorationImage(
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
                image: NetworkImage(""),
              ),
            )),
        baseColor: Colors.white,
        highlightColor: Colors.white12);
  }
}
