import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:swooshed_app/Model/all_category_model/all_category_model.dart';

import 'package:swooshed_app/utils/app_urls/app_urls.dart';

import '../../Model/active_poster_model/active_poster_model.dart';
import 'package:http/http.dart' as http;

class AllCategoriesProvider extends ChangeNotifier {
  int _currentIndex = -1;

  int get currentIndex => _currentIndex;


  void selectedIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
  List<GetAllCategoriesModel> myCategoriesList = [];

  Future<void> getAllCategories() async {
    final url = AppUrls.getPosterBaseUrl + AppUrls.getAllCategoriesEndPoint;
    final response = await http.get(Uri.parse(url));
    print(response.request);
    print("************** ${response} **********************");
    var data = jsonDecode(response.body.toString());
    // print("************** ${data} **********************");
    try {
      if (response.statusCode == 200) {
        print("***********   SUCCESS  CAte gories ****************");
        myCategoriesList.clear();
        myCategoriesList.add(GetAllCategoriesModel.fromJson(data));


        print("body dta   ====>  ${response.body} ");
        print("model dta   ====>  ${myCategoriesList[0].categories![0].image} ");
        // myCategoriesList.add(GetAllCategoriesModel.fr);
        notifyListeners();
      } else {
        print("***********   Failed ****************");

        print(response.reasonPhrase);
        notifyListeners();
      }
    } catch (e) {
     print(e.toString());
    }
  }
}
