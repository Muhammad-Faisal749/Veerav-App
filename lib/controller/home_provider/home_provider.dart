import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:swooshed_app/utils/app_urls/app_urls.dart';

import '../../Model/active_poster_model/active_poster_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  List<ActivePosterModel> myPosterList = [];

  Future<void> getPosterApi() async {
    final url = AppUrls.getPosterBaseUrl + AppUrls.posterEndPoint;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        myPosterList.clear();
        myPosterList.add(ActivePosterModel.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        print(response.reasonPhrase);
        notifyListeners();
      }
    } catch (e) {}
  }
}
