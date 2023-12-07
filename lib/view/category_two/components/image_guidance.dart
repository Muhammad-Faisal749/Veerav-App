import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageGuidance extends StatelessWidget {
  const ImageGuidance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 5),
        CustomText(
          text: AppLocalizations.of(context)!.image_Guidance,
          style: AppTextStyles.heading1,
        ),
      ],
    );
  }
}
