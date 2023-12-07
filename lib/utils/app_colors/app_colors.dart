import 'package:flutter/material.dart';

class AppColors {
  //App Background Color
  static const Color bgColor = Color(0xFF1C1C1E);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color textColor2 = Color(0xFFE007CF);
  static const Color textColor3 = Color(0xFF666666);

  static const Color btnTextColor = Color(0xFF999999);
  static const Color btnBgColor = Color(0xFFCCCCCC);

  static const Color textColorGrey = Color(0xBFF2F2F2);
  static const Color textColorWhite = Color(0xFFFFFFFF);

  /// Linear Gradient Color of buttons
  static const Color color1 = Color(0xFFE007CF);
  static const Color color2 = Color(0xFF1A35FB);

  static LinearGradient customLinearGradient = const LinearGradient(
    begin: Alignment(0.94, -0.35),
    end: Alignment(-0.94, 0.35),
    colors: [color1, color2],
    stops: [0.0132, 0.9794],
    transform: GradientRotation(110 * 3.14159265359 / 180),
  );

  ///Containers Background Gradient Color
  static const LinearGradient textGradient = LinearGradient(
    begin: Alignment(0.90, -2.10),
    end: Alignment(0.7, -4.00),
    colors: [Color(0xFF271F53), Color(0xFF4D174A)],
  );

  ///Text Field Hint Text Color
  static const Color hintTextColor = Color(0xFFCCCCCC);

  ///Opacity Color of OnBoarding Containers
  static final LinearGradient onBoardingGradientColor = LinearGradient(
    begin: const Alignment(0.94, -0.34),
    end: const Alignment(-0.94, 0.34),
    colors: [
      Colors.white.withOpacity(0.25),
      Colors.black.withOpacity(0.25),
    ],
  );

  ///  button gradient
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment(1.84, -1.95),
    end: Alignment(-0.94, 0.95),
    colors: [Color(0xFF1A35FB), Color(0xFFE007CF)],
  );

  static const LinearGradient textbggradient = LinearGradient(
    begin: Alignment(0.94, -0.35),
    end: Alignment(-0.94, 0.35),
    colors: [Color(0xFF271F53), Color(0xFF4D174A)],
  );

  /// Your Authentiction
  static const Color redColor = Color(0xFFFF554C);
  static const Color blueColor = Color(0xFF1A35FB);

  ///linear gredient
  static LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffE007CF),
      Color(0xff1A35FB),
    ],
  );

  static Color gradientStart = Color(0xffE007CF);
  static Color gradientEnd = Color(0xff1A35FB);

  static LinearGradient mediumGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff4D174A),
      Color(0xff1B2255),
    ],
  );
  static LinearGradient smallContainerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(224, 7, 207, 0.25),
      Color.fromRGBO(26, 53, 251, 0.25)
    ],
  );
}
