import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_images/app_images.dart';

class WalletTokenModel {
  String? image;
  String? text;
  String? price;
  double? width;
  double? height;

  WalletTokenModel(
      {this.image, this.text, this.price, this.width, this.height});
}

List<WalletTokenModel> myTokenDataList(BuildContext context) {
  return [
    WalletTokenModel(
        text: AppLocalizations.of(context)!.tokens2,
        image: AppImages.token2Image,
        price: AppLocalizations.of(context)!.iDR,
        width: 75.w,
        height: 47.h),
    WalletTokenModel(
        text: AppLocalizations.of(context)!.tokens2,
        image: AppImages.token4Image,
        price: AppLocalizations.of(context)!.iDR,
        width: 58.w,
        height: 55.h),
    WalletTokenModel(
        text: AppLocalizations.of(context)!.tokens2,
        image: AppImages.token8Image,
        price: AppLocalizations.of(context)!.iDR,
        width: 75.w,
        height: 47.h),
  ];
}
