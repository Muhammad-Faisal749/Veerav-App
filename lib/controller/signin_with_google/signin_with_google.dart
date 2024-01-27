import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver/files.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:swooshed_app/utils/app_constants/app_constant.dart';

import '../../Model/google_auth_model/google_auth_model.dart';
import '../../view/bottom_nav_bar/nav_bar.dart';

class SocialMediaLoginProvider extends ChangeNotifier {
  List<GoogleAuthModel> myGoogleAuthList = [];

  Future<void> googleLoginApi(
      {required String email,
        required String userName,
        required String name,
        required String phoneNumber,
        required String image,
        required String authType}) async {
    // setLoading(true);
    var url =
    Uri.parse("http://161.97.129.139:5001/api/user/googleLoginOrSignup");
    var response = await http.post(url, body: {
      "email": email,
      "userName": userName,
      "name": name,
      "phoneNumber": phoneNumber,
      "image": image,
      "authType": authType,
    }, headers: {
      // 'Content-Type: application/json';
    });

    print("************** My Api response = $response ******************");

    var data = jsonDecode(response.body.toString());
    print("*****************$data******************");

    try {
      if (response.statusCode == 200) {
        myGoogleAuthList.add(GoogleAuthModel.fromJson(data));
        print("*************** Api ---SUCCESS *******************");
        Get.offAll(() => BottomNav());
        AppTexts.flutterToast(error: false, message: "Success");
      } else {
        print("ERROR");
        AppTexts.flutterToast(error: true, message: "ERROR");
      }
    } catch (e) {
      e.toString();
    }
  }

  ///SignUp with google credentials
  signInWithGoogle({required BuildContext context, required String authType}) async {
    print("Google Login Method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    print("******************* Before Try ***********************");
    try {
      print("******************* After Try ***********************");
      print("***************** Firebase SUCCESS ************************* ");

      /// Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      /// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser!.authentication;

      /// Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential value =
      await FirebaseAuth.instance.signInWithCredential(credential);
      googleLoginApi(
        email: value.user!.email.toString(),
        name: value.user!.displayName.toString(),
        image: value.user!.photoURL.toString(),
        authType: authType,
        userName: value.user!.displayName.toString(),
        phoneNumber: value.user!.phoneNumber.toString(),
      );
      print(" MY ALL DAta is = ${googleLoginApi(
        email: value.user!.email.toString(),
        name: value.user!.displayName.toString(),
        image: value.user!.photoURL.toString(),
        authType: authType,
        userName: value.user!.displayName.toString(),
        phoneNumber: value.user!.phoneNumber.toString(),
      )}");
      print(
          "*******************User Credentials ${UserCredential} ****************************");
      Get.to(() => BottomNav());
      AppTexts.flutterToast(message: "SUCCESS", error: true);

      /// Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("***************** Firebase Error ************************* ");
      e.toString();
    }
  }

  GoogleSignInAccount? _googleUser;

// Future<void> signInWithGoogle({required BuildContext, required String authType}) async {
//   try {
//     GoogleSignIn googleSignIn = GoogleSignIn(
//       scopes: [
//
//         ///TODO: put scopes app will use
//       ],
//     );
//
//     /// if previously signed in, it will signin silently
//     /// if not, the signin dialog/login page will pop up
//     _googleUser =
//         await googleSignIn.signInSilently() ?? await googleSignIn.signIn();
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }
//
// ///sign out from google
// Future<void> signOut() async {
//   GoogleSignIn googleSignIn = GoogleSignIn();
//   await googleSignIn.signOut();
//   _googleUser = null;
// }
}
