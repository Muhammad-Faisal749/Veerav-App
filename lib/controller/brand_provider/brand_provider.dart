import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:swooshed_app/Model/choose_brand_model/choose_brand_model.dart';
import 'package:swooshed_app/utils/app_urls/app_urls.dart';
import 'package:http/http.dart' as http;

class ChooseBrandProvider extends ChangeNotifier {
  int _currentIndex = -1;

  int get currentIndex => _currentIndex;

  void selectedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<ChooseBrandModel> myBrandList = [];
  List<ChooseBrandModel> searchingList = [];

  void filterBrands(String query) {
    searchingList.clear();
    query = query.toLowerCase();
    searchingList = myBrandList
        .where((brand) => brand.brand![0].name!.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  updateSearch() {
    if (searchingList.isEmpty) {
    } else {}
  }

  Future<void> getAllBrands() async {
    final url = AppUrls.getPosterBaseUrl + AppUrls.chooseBrandEndPoint;
    final response = await http.get(Uri.parse(url));
    print(response.request);
    print("************** ${response} **********************");
    var data = jsonDecode(response.body.toString());

    try {
      if (response.statusCode == 200) {
        print("***********   SUCCESS  Brands ****************");
        myBrandList.clear();
        myBrandList.add(ChooseBrandModel.fromJson(data));
        searchingList = List.from(myBrandList);
        notifyListeners();
      } else {
        print("***********  ----Failed to fetch brands----  ****************");
        print(response.reasonPhrase);
        notifyListeners();
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
