import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:swooshed_app/controller/loginProvider/login_provider.dart';

import '../../Model/check_result_model/check_result_model.dart';
import 'package:http/http.dart' as http;

class CheckResultProvider extends ChangeNotifier {
  List<CheckResultModel> checkResultList = [];

  Future<void> CheckResultApi() async {
    var headers = {'Content-Type': 'application/json'};
    var request = await http.Request(
        'GET',
        Uri.parse(
            'http://161.97.129.139:5001/api/admin/getCheckedProductByUserID'));
    request.body = json.encode({"_id": LoginProvider.userId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print(
          "******************** SUCCESS Check Result Id ************************");
      print(
          "******************** Check Result Id ===== ${response.statusCode}");

      // print("******************** SUCCESS ID Token ************************");
      Map<String, dynamic> jsonMap = json.decode(responseBody);
      print("******************** Check Result APi   body ===== ${responseBody}");
      checkResultList.add(CheckResultModel.fromJson(jsonMap));
      notifyListeners();
    } else {
      print(
          "******************** Check Result Id statusCode ===== ${response.statusCode}");
      Map<String, dynamic> jsonMap = json.decode(request.body);
      print("******************** Check Result Id body ===== ${request.body}");
      notifyListeners();
    }
  }
}
