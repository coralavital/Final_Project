// imports
import 'dart:convert';
import 'package:final_project/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/list_model.dart';

// List repo class
class ListRepo {
  final SharedPreferences sharedPreferences;
  ListRepo({required this.sharedPreferences});

  List<String> list = [];

  void addToCartList(List<ListModel> cartList) {

    list = [];
    var time = DateTime.now().toString();
    for (var element in cartList) {
      element.time = time;
      continue;
    }
    sharedPreferences.setStringList(AppConstants.cartList, list);
  }

  List<ListModel> getCartList() {
    List<ListModel> list = [];
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
    }
    for (var element in carts) {
      list.add(ListModel.fromJson(jsonDecode(element)));
    }
    return list;
  }

  void removeCart() {
    list = [];
    sharedPreferences.remove(AppConstants.cartList);
  }
}
