import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        AppColors.gradientStart,
        Color.fromRGBO(26, 53, 251, 0.25),
        AppColors.gradientStart,
      ],
    ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Text(
      AppLocalizations.of(context)!.iDR,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.35,
        foreground: new Paint()..shader = linearGradient,
      ),
    );
  }
}
