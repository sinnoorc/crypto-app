import '../../../constants/app_url.dart';
import '../service/api_service.dart';

class AssetApi {
  final ApiService _apiService = ApiService();

  Future getAssets() async {
    try {
      final response = await _apiService.get(AppUrl.assets);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
