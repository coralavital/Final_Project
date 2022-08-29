// imports
import 'dart:convert';
import 'package:food_delivery_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/list_model.dart';

// List repo class
class ListRepo {
  final SharedPreferences sharedPreferences;
  ListRepo({required this.sharedPreferences});

  List<String> list = [];

  void addToCartList(List<ListModel> cartList) {
    // sharedPreferences.remove(AppConstants.cartList);
    // sharedPreferences.remove(AppConstants.cartHistoryList);
    list = [];
    var time = DateTime.now().toString();
    cartList.forEach((element) {
      element.time = time;
      return list.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.cartList, list);
    //print(sharedPreferences.getStringList(AppConstants.cartList));
  }

  List<ListModel> getCartList() {
    List<ListModel> list = [];
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
    }
    carts.forEach((element) {
      list.add(ListModel.fromJson(jsonDecode(element)));
    });
    return list;
  }

  void removeCart() {
    list = [];
    sharedPreferences.remove(AppConstants.cartList);
  }
}
