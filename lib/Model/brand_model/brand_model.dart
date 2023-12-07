import 'package:flutter/cupertino.dart';

import '../../utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandModel {
  String imgUrl;
  String titleText;
  String subTitle;

  BrandModel(
      {required this.imgUrl, required this.titleText, required this.subTitle});
}

List<BrandModel> getData(BuildContext context) {
  return [
    BrandModel(
        imgUrl: AppImages.antisocialmedia,
        titleText: AppLocalizations.of(context)!.hyped,
        subTitle: AppLocalizations.of(context)!.anti),
    BrandModel(
        imgUrl: AppImages.aape,
        titleText: AppLocalizations.of(context)!.hyped,
        subTitle: AppLocalizations.of(context)!.a_bathing),
    BrandModel(
        imgUrl: AppImages.bathing,
        titleText: AppLocalizations.of(context)!.hyped,
        subTitle: AppLocalizations.of(context)!.aape),
    BrandModel(
        imgUrl: AppImages.adidas,
        titleText: AppLocalizations.of(context)!.hyped,
        subTitle: AppLocalizations.of(context)!.adidas),
    BrandModel(
        imgUrl: AppImages.amiri,
        titleText: AppLocalizations.of(context)!.hyped,
        subTitle: AppLocalizations.of(context)!.amiri),
    BrandModel(
        imgUrl: AppImages.alexander,
        titleText: 'Luxury',
        subTitle: AppLocalizations.of(context)!.alexander),
  ];
}
