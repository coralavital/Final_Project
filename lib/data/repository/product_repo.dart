// imports
import 'package:final_project/data/api/api_client.dart';
import 'package:final_project/utils/constants.dart';
import 'package:get/get.dart';

// PopularProductRepo class
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}
