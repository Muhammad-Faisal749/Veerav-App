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

  Future<void> getLoginMethod({
    required String email,
    required String password,
    // BuildContext context,
  }) async {
    setLoading(true);

    try {
      print(email);
      print(password);
      var url = Uri.parse(AppUrls.baseUrl + AppUrls.loginEndPoint);
      var response = await http.post(url, body: {
        "email":email,
        "password":password
      });

      print("************** $response ******************");

      var data = jsonDecode(response.body.toString());
      print("***************** ${response.statusCode} ******************");
      print("***************** ${response.body} ******************");
  Map<String,dynamic> map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        myLoginList.add(LoginModel.fromJson(data));
        print("*************** SUCCESS *******************");
        setLoading(false);


        ///Saving User Token
        AppTexts.userToken = myLoginList[0].jwtToken.toString();
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(AppTexts.tokenKey, data['jwtToken']);
        AppTexts.userType = myLoginList[0].role.toString();

        /// Saving User Id
        userId = myLoginList[0].sId.toString();

        saveId = sp.setString(idKey, data['_id']);
        print("*****************  USER ID = $userId *******************");
        print(
            "*****************  SAVED USER ID  = $saveId *******************");
        Get.offAll(() => BottomNav());
      } else {
        print("this is else  ${response.statusCode} in here ");
        AppTexts.flutterToast(message: map['message'], error: true);
        print(response.reasonPhrase);
        setLoading(false);


      }


    } catch (e) {
      print("********************* EXCEPTION ***************************");
      print(e.toString());

      setLoading(false);
    }
  }
}
