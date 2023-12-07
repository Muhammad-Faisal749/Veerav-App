import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_images/app_images.dart';

class CategoriesModel {
  String? img;
  double? imageWidth;
  double? imageHeight;
  String? text;

  CategoriesModel({this.img, this.imageHeight, this.imageWidth, this.text});
}

List<CategoriesModel> categoriesDataList(BuildContext context) {
  return [
    CategoriesModel(
        img: AppImages.electronicsLogo,
        imageHeight: 19.h,
        imageWidth: 16.w,
        text: AppLocalizations.of(context)!.electronic),
    CategoriesModel(
      img: AppImages.fashionLogo,
      imageHeight: 19.h,
      imageWidth: 25.w,
      text: AppLocalizations.of(context)!.fashion,
    ),
    CategoriesModel(
      img: AppImages.collectibleLogo,
      imageHeight: 19.h,
      imageWidth: 27.w,
      text: AppLocalizations.of(context)!.collectible,
    ),
    CategoriesModel(
        img: AppImages.healthLogo,
        imageHeight: 19.h,
        imageWidth: 23.w,
        text: AppLocalizations.of(context)!.health),
    CategoriesModel(
        img: AppImages.bookLogo,
        imageHeight: 19.h,
        imageWidth: 24.w,
        text: AppLocalizations.of(context)!.book),
    CategoriesModel(
        img: AppImages.othersLogo,
        imageHeight: 19.h,
        imageWidth: 20.w,
        text: AppLocalizations.of(context)!.other),
  ];
}
