import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppTexts {
  static const notLoginText1 = "We Didn’t Recognize You";
  static const notLoginText2 =
      "Sign in to your account to getting started\nauthenticate your items and buy anything\nwithout worries!";

// Varify Email Screen Text
  static const emailText1 = "Just one step to go!";
  static const emailText2 =
      "While you're creating your account,\nyou'll get an email from Swooshed Team.\nOpen your email and find the email\nto verify your account!";
  static const varifyText1 = "Congratulations!";
  static const varifyText2 =
      "Your account has been verified, now can\nyou can access more features on\nSwooshed prepared for you!";

  //OnBoarding Text 1
  static const onBoardingText =
      "You are one step closer to authenticate your\nitems. Start authenticate your items now!";

  //Payment Success Text
  static const paymentSuccessText1 = "Payment Success!";
  static const paymentSuccessText2 =
      "Thank you for your payment, your order is\non process.";

  //Payment Method Text
  static const paymentMethodText1 = "Payment Method";
  static const paymentMethodText2 =
      "Choose payment method you want to use for\npaying your Swooshed Token";
  static List<String?> imagesfiles = [];

  //Checkout Screen Text
  static const checkoutText1 = "Summary Order";
  static const checkoutText2 = "Check your item before doing the payment";

  // Qr Certifate
  static const qrTextOne =
      "We, Swooshed, an independent third-party authentication platform, confirm that item (xxx) is fake based on the photos provided and within compliance of the characteristics required by it's designer brand. ";
  static const qrTextTwo =
      "Photos of the item will be attached below. This certificate can serve as evidence for the item’s standing authenticity. ";
  static const qrTextThree =
      "Notice for certificates proprietor: Be aware of this when sharing the link. Your information is attached to the certificate file. ";
  static const qrTextFour =
      "(Only trust files that are facilitated on Swooshed platform. All archives will be put away on our data center. Other reports will be viewed as illegitimate)";

  static String getStarted =
      'You are one step closer to authenticate your items. Please fill some details to proceed to authentication process';
  static String successText =
      'Thank you for filling the details and do the payment, we will proceed with your authentication process';

  /// User Tokens Saving
  static String tokenKey = 'token';
  static String userToken = '';
  static String userType = '';
  static String saveUserType = '';

  ///Toast
  static flutterToast({required String message, required bool error}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: error == true ? Colors.greenAccent : Colors.yellow,
        fontSize: 14,
        timeInSecForIosWeb: 1,
        textColor: Colors.white);
  }

  static spinKitCircle() => Center(
        child: SpinKitFadingCircle(
          size: 30,
          color: Colors.pinkAccent,
        ),
      );
  static spinKitAnimation() => Center(
        child: SpinKitRotatingCircle(
          size: 30,
          color: Colors.pinkAccent,
        ),
      );
}
