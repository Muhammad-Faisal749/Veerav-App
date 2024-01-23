import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:swooshed_app/controller/loginProvider/login_provider.dart';

import '../../Model/token_model/token_model.dart';

class GetTokenProvider extends ChangeNotifier {
  List<TokenModel> tokenList = [];

  Future<void> getTokenApi() async {
    var headers = {'Content-Type': 'application/json'};
    var request = await http.Request(
        'POST', Uri.parse('http://161.97.129.139:5001/api/user/getTokenById'));
    request.body = json.encode({"_id": LoginProvider.userId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("******************** Before if Token Api ************************");
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print("******************** SUCCESS ID Token ************************");
      print("******************** Token Api statuscode ===== ${response.statusCode}");

      // print("******************** SUCCESS ID Token ************************");
      Map<String, dynamic> jsonMap = json.decode(responseBody);
      print("******************** Token Api body ===== ${responseBody}");
      tokenList.add(TokenModel.fromJson(jsonMap));
      notifyListeners();

    } else {
      print(response.reasonPhrase);
      print("******************** Token Api statuscode ===== ${response.statusCode}");
      Map<String, dynamic> jsonMap = json.decode(request.body);
      print("******************** Token Api body ===== ${request.body}");
      notifyListeners();
    }
  }
}

