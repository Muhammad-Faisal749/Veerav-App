import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:swooshed_app/view/sign_in/login.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isLoading = false;
  XFile? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  bool get isLoading => _isLoading;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _pickedImage = pickedImage;
      notifyListeners();
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getSignUpMethod({
    required String name,
    required String userName,
    required String email,
    required String phoneNo,
    required String password,
  }) async {
    setLoading(true);

    try {
      var url = Uri.parse(AppUrls.baseUrl + AppUrls.signupEndPoint);

      var request = http.MultipartRequest('POST', url);
      request.fields.addAll({
        'name': name,
        'userName': userName,
        'email': email,
        'phoneNumber': phoneNo,
        'password': password,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', _pickedImage!.path.toString()));

      http.StreamedResponse response = await request.send();
      var geer = await http.Response.fromStream(response);
      Map<String, dynamic> map = jsonDecode(geer.body);

      if (response.statusCode == 200) {
        print('********************** ${map['message']} *****************************************');
        print('**************** SIGNUP Success ********************');
        print(await response.stream.bytesToString());
        setLoading(false);
        Get.to(() => LoginScreen());
      } else {
        setLoading(false);
        print('**************** FAILED  ${map['message']} ********************');
      }
    } catch (e) {
      setLoading(false);
      print('**************** FAILED catech $e ********************');
      print(e.toString());
    }
  }
}
