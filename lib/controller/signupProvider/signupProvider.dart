import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swooshed_app/utils/app_urls/app_urls.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isLoading = false;

  // List<SignUpModel> mySignUpList = [];

  bool get isLoading => _isLoading;

  ///Function for Circular Progress Indicator

  void setLoading(bool value) {
    _isLoading = value;
    print("$value");
    notifyListeners();
  }

  Future<void> getSignUpMethod({
    required String name,
    required String userName,
    required String email,
    required String phoneNo,
    required String password,
    required String image
  }) async {
    setLoading(true);

    var url = Uri.parse(AppUrls.baseUrl + AppUrls.signupEndPoint);
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'name': name,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNo,
      'password': password,
      // 'image':image.toString(),
    });
    // request.files.add(http.MultipartFile(
    //   'image',
    //   http.ByteStream(image),
    //   await image.size,
    //   filename: basename(image.path),
    // ));

    var response = await request.send();
    var data = await response.stream.bytesToString();
    // var response = await http.post(url, body: {
    //   'name': name,
    //   'userName':userName,
    //   'email':email,
    //   'phoneNumber':phoneNo,
    //   'password':password,
    //   'image':image
    // }, headers: {
    //   // 'Content-Type: application/json';
    // });

    print("**************-- $request --******************");

    // var data = jsonDecode(request.body.toString());
    print("*****************$data******************");

    try {
      // if (response.statusCode == 200) {
      //   // mySignUpList.add(SignUpModel.fromJson(data));
      //   // request.fields.addAll(other)
      //
      //   print("*************** SUCCESS *******************");
      //   setLoading(false);
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      //       backgroundColor: Colors.green,
      //       content: CustomText(
      //         text: "SUCCESS",
      //         style:
      //             AppTextStyles.fontSize14to700.copyWith(color: Colors.white),
      //       )));
      //   Get.offAll(() => LoginScreen());
      // } else {
      //   print("ERROR");
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      //       backgroundColor: Colors.redAccent,
      //       content: CustomText(
      //         text: "Failed",
      //         style:
      //             AppTextStyles.fontSize14to700.copyWith(color: Colors.white),
      //       )));
      //   setLoading(false);
      // }
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://161.97.129.139:5001/api/user/signup'));
      request.fields.addAll({
        'name': name,
        'userName': userName,
        'email': email,
        'phoneNumber': phoneNo,
        'password': password
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', image.toString()));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      e.toString();
    }
  }
}
