import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swooshed_app/view/payment_method/components/payment_method_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/app_images/app_images.dart';

class VirtualAccount extends StatelessWidget {
  const VirtualAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodContainer(
            imgUrl: AppImages.paymentMethodImage1,width: 24.w,height: 24.h,
            title: AppLocalizations.of(context)!.bca),
        SizedBox(height: 12),
        PaymentMethodContainer(
            imgUrl: AppImages.bank_mandiri,width: 24.w,height: 24.h,  title:
        AppLocalizations.of(context)!.mandiri),
      ],
    );
  }
}
