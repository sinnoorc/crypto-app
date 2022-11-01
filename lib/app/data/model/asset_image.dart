import 'dart:convert';

List<AssetsImage> assetsImageFromJson(String str) =>
    List<AssetsImage>.from(json.decode(str).map((x) => AssetsImage.fromJson(x)));

class AssetsImage {
  AssetsImage({
    this.assetId,
    this.url,
  });

  factory AssetsImage.fromJson(Map<String, dynamic> json) {
    return AssetsImage(
      assetId: json["asset_id"],
      url: json["url"],
    );
  }

  String? assetId;
  String? url;
}
