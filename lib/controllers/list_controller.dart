// imports
import 'package:final_project/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/list_repo.dart';
import '../models/list_model.dart';

// ListController class
class ListController extends GetxController {
  final ListRepo listRepo;
  ListController({required this.listRepo});

  Map<int, ListModel> _items = {};
  Map<int, ListModel> get items => _items;
  List<ListModel> storageItems = [];

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return ListModel(
          id: value.id,
          name: value.name,
          img: value.img,
          price: value.price,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return ListModel(
            id: product.id,
            name: product.name,
            img: product.img,
            price: product.price,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
            'Item count', 'You should at least add 1 item to the cart.');
      }
    }
    listRepo.addToCartList(getItems);
    update();
  }

  bool existInCartList(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<ListModel> get getItems {
    //return _items.entries.map((e) {
    //  return e.value;
    //}).toList();
    return [
      ListModel(
          id: 11,
          name: "Hilsha fish",
          img: "images/1343ce6cf6792383dfc071727afd5c46.jpeg",
          quantity: 3),
      ListModel(
          id: 12,
          name: "Hilsha fish",
          img: "images/1343ce6cf6792383dfc071727afd5c46.jpeg",
          quantity: 4)
    ];
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<ListModel> getCardData() {
    return storageItems;
  }

  set setList(List<ListModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void clear() {
    _items = {};
    update();
  }

  set setItems(Map<int, ListModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    listRepo.addToCartList(getItems);
    update();
  }
}
