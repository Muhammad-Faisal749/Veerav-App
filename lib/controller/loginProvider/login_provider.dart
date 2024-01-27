import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swooshed_app/utils/app_constants/app_constant.dart';
import 'package:swooshed_app/utils/app_styles/app_text_styles.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/view/home/home.dart';
import 'package:swooshed_app/widgets/custom_text/custom_text.dart';

import '../../Model/loginModel/login_model.dart';
import 'package:http/http.dart' as http;

import '../../view/bottom_nav_bar/nav_bar.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<LoginModel> myLoginList = [];

  bool get isLoading => _isLoading;
  static var userId;
  static var saveId;
  static String idKey = "idKey";

  ///Function for Circular Progress Indicator

  void setLoading(bool value) {
    _isLoading = value;
    print("$value");
    notifyListeners();
  }

  Future<void> getLoginMethod(
      {required String email, required String password}) async {
    setLoading(true);
    var url = Uri.parse(AppUrls.baseUrl + AppUrls.loginEndPoint);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    }, headers: {
      // 'Content-Type: application/json';
    });

    print("************** $response ******************");

    var data = jsonDecode(response.body.toString());
    print("*****************$data******************");

    try {
      if (response.statusCode == 200) {
        myLoginList.add(LoginModel.fromJson(data));
        print("*************** SUCCESS *******************");
        setLoading(false);
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: CustomText(
              text: "SUCCESS",
              style:
                  AppTextStyles.fontSize14to700.copyWith(color: Colors.white),
            )));

        ///Saving User Token
        AppTexts.userToken = myLoginList[0].jwtToken.toString();
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(AppTexts.tokenKey, data['jwtToken']);

        /// Saving User Id
        // userId = sp.setString(idKey ,data['_id']);
        userId = myLoginList[0].sId.toString();
        saveId = sp.setString(idKey, data['_id']);
        print(
            "*****************  bnmk,l.l,kmjnhbgv ID = $userId *******************");
        print(
            "*****************  SAVED USER ID  = $saveId *******************");
        Get.offAll(() => BottomNav());
      } else {
        print("ERROR");
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: CustomText(
              text: "Invalid email and Password",
              style:
                  AppTextStyles.fontSize14to700.copyWith(color: Colors.white),
            )));
        setLoading(false);
      }
    } catch (e) {
      e.toString();
    }
  }
}
