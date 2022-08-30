// imports
import 'package:final_project/controllers/list_controller.dart';
import 'package:final_project/data/repository/product_repo.dart';
import 'package:final_project/models/list_model.dart';
import 'package:final_project/models/product_model.dart';
import 'package:get/get.dart';

// PopularProductController class
class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late ListController _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item count', 'You cannot reduce more!');
      if (_inCartItems > 0) {
        _quantity = -_quantity;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, ListController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _list = cart;
    var exist = false;
    exist = _list.existInCartList(product);
    if (exist) {
      _inCartItems = _list.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _list.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _list.getQuantity(product);
    _list.items.forEach((key, value) {
    });
    update();
  }

  int get totalItems {
    return _list.totalItems;
  }

  List<ListModel> get getItems {
    return _list.getItems;
  }
}
