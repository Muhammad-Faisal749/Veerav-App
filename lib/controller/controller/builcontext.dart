import 'package:flutter/material.dart';
class BuildContextProvider with ChangeNotifier {
  BuildContext? context;

  void setContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }
}