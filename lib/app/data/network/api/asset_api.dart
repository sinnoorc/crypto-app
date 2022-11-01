import 'package:dio/dio.dart';

import '../../../constants/app_url.dart';
import '../service/api_service.dart';

class AssetApi {
  final ApiService _apiService = ApiService();

  Future<Response> getAssets() async {
    try {
      final response = await _apiService.get(AppUrl.assets);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //get asset image
  Future<Response> getAssetImage() async {
    try {
      final response = await _apiService.get(AppUrl.assetImage);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
