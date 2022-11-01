import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../data/model/asset_image.dart';
import '../../../data/model/assets.dart';
import '../../../data/network/api/asset_api.dart';
import '../../../data/network/service/api_exception.dart';

class HomeController extends GetxController with StateMixin {
  final AssetApi _assetApi = AssetApi();

  final RxList<Assets> _assets = <Assets>[].obs;
  List<Assets> get assets => _assets;

  final RxList<AssetsImage> _assetsImage = <AssetsImage>[].obs;
  List<AssetsImage> get assetsImage => _assetsImage;

  Future<void> getAssets() async {
    try {
      final Response response = await _assetApi.getAssets();
      if (response.statusCode == 200) {
        final jsonData = jsonEncode(response.data);
        final assets = assetsFromJson(jsonData);
        if (assets.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          assets.removeWhere((element) => element.typeIsCrypto != 1);
          _assets.value = assets;
          change(assets, status: RxStatus.success());
        }
      }
    } on DioError catch (e) {
      final error = ApiException.fromDioError(e).toString();
      change(null, status: RxStatus.error(error));
      Get.log(error);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      rethrow;
    }

    //get asset Image
    try {
      final Response response = await _assetApi.getAssetImage();
      if (response.statusCode == 200) {
        final jsonData = jsonEncode(response.data);
        final assetsImage = assetsImageFromJson(jsonData);
        if (assetsImage.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          _assetsImage.value = assetsImage;
          change(assetsImage, status: RxStatus.success());
        }
      }
    } on DioError catch (e) {
      final error = ApiException.fromDioError(e).toString();
      change(null, status: RxStatus.error(error));
      Get.log(error);
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      rethrow;
    }
  }

  @override
  void onInit() {
    getAssets();
    super.onInit();
  }
}
