import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/utils/app_colors/app_colors.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RowComponent extends StatelessWidget {
  RowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(
          color: AppColors.textColor,
          height: 0.21.h,
        )),
        CustomText(
          text: AppLocalizations.of(context)!.or_sign_in_with,
          style: AppTextStyles.fontSize14to400,
        ),
        Expanded(
            child: Divider(
          color: AppColors.textColor,
          height: 0.21.h,
        )),
      ],
    );
  }
}
