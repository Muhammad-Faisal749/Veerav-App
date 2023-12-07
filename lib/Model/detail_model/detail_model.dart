
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_images/app_images.dart';

class DetailModel {
  String text;
  String imgUrl;
  DetailModel({required this.text, required this.imgUrl});
}


List<DetailModel> detailList(BuildContext context) {
  return [
    DetailModel(
        text: AppLocalizations.of(context)!.appearance, imgUrl: AppImages
        .appearance),
    DetailModel(text: AppLocalizations.of(context)!.frontSide, imgUrl: AppImages
        .front_side),
    DetailModel(text: AppLocalizations.of(context)!.backSide, imgUrl: AppImages
        .back_side),
    DetailModel(text: AppLocalizations.of(context)!.inside, imgUrl: AppImages
        .inside),
    DetailModel(text: AppLocalizations.of(context)!.priceTag, imgUrl: AppImages
        .price_tag),
    DetailModel(text: AppLocalizations.of(context)!.sideTag, imgUrl: AppImages
        .side_tag),
    DetailModel(text: AppLocalizations.of(context)!.receipt, imgUrl: AppImages
        .receipt),
    DetailModel(text: AppLocalizations.of(context)!.additional, imgUrl: AppImages
        .additional),
  ];
}