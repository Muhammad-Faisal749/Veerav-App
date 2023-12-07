import 'package:flutter/material.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckResultModel {
  String? text1;
  String? text2;
  String? bgImage;
  String? image;

  CheckResultModel({this.image, this.text1, this.text2, this.bgImage});
}

List<CheckResultModel> myCheckResultDataList(BuildContext context) {
  return [
    CheckResultModel(
        text1: AppLocalizations.of(context)!.shoe,
        text2: AppLocalizations.of(context)!.louis_vuition_bag,
        image: AppImages.tickLogo,
        bgImage: AppImages.checkResultLogo1),
    CheckResultModel(
        text1: AppLocalizations.of(context)!.shoe,
        text2: AppLocalizations.of(context)!.louis_vuition_bag,
        image: AppImages.crossLogo,
        bgImage: AppImages.checkResultLogo2),
    CheckResultModel(
        text1: AppLocalizations.of(context)!.shoe,
        text2: AppLocalizations.of(context)!.louis_vuition_bag,
        image: AppImages.tickLogo,
        bgImage: AppImages.checkResultLogo3),
    CheckResultModel(
        text1: AppLocalizations.of(context)!.shoe,
        text2: AppLocalizations.of(context)!.louis_vuition_bag,
        image: AppImages.crossLogo,
        bgImage: AppImages.checkResultLogo4),
  ];
}
