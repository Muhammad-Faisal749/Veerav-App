



import 'package:flutter/cupertino.dart';

class PaymentMethodProvider extends ChangeNotifier{

  ///Variable Declaration of on select the payment method
  int _selectedPaymentIndex = -1;
  bool _isSelectedButton = false;

  int get selectedPaymentIndex => _selectedPaymentIndex;

  bool get selectedButton => _isSelectedButton;

  ///Function Declaration of on select the payment method
  void handleContainerTap(int index) {
    if (_selectedPaymentIndex == index) {
      _selectedPaymentIndex = -1;
      _isSelectedButton = false;
    } else {
      _selectedPaymentIndex = index;
      _isSelectedButton = true;
    }
    notifyListeners();
  }

}