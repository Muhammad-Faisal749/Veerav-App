import 'package:flutter/material.dart';
import 'package:swooshed_app/utils/app_images/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryModel {
  String iconPath;
  String title;
  String subtitle;
  HistoryModel(
      {required this.iconPath, required this.subtitle, required this.title});
}

List<HistoryModel> historyDetailsList(BuildContext context) {
  return [
    HistoryModel(
        iconPath: AppImages.historyWaitingPayment,
        subtitle:
            AppLocalizations.of(context)!.we_will_authenticate_your_Louis_Vuiton,
        title: AppLocalizations.of(context)!.waiting_for_payment),
    HistoryModel(
        iconPath: AppImages.historyInsufictientPayment,
        subtitle:
             AppLocalizations.of(context)!.we_need_more_photos_to_continue,
        title: AppLocalizations.of(context)!.insufictient_Photos),
    HistoryModel(
        iconPath: AppImages.historyAuthentic,
        subtitle:
             AppLocalizations.of(context)!.we_will_authenticate_your_Louis_Vuiton,
        title: AppLocalizations.of(context)!.authentic),
    HistoryModel(
        iconPath: AppImages.historyfalse,
        subtitle:
            AppLocalizations.of(context)!.your_Louis_Vuiton_Bag_is_fake,
        title: AppLocalizations.of(context)!.fake),
    HistoryModel(
        iconPath: AppImages.historyAuthenticateProcess,
        subtitle:
             AppLocalizations.of(context)!.we_will_authenticate_your_Louis_Vuiton,
        title: AppLocalizations.of(context)!.on_authenticate_Proces),
    HistoryModel(
        iconPath: AppImages.historyIndefinable,
        subtitle:
            AppLocalizations.of(context)!.we_will_authenticate_your_Louis_Vuiton,
        title: AppLocalizations.of(context)!.indefinable),
  ];
}
