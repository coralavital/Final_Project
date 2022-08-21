import 'package:food_delivery_flutter/data/api/api_client.dart';
import 'package:food_delivery_flutter/utils/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}
