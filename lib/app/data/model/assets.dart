// To parse this JSON data, do
//
//     final assets = assetsFromJson(jsonString);

import 'dart:convert';

List<Assets> assetsFromJson(String str) => List<Assets>.from(json.decode(str).map((x) => Assets.fromJson(x)));

class Assets {
  Assets({
    this.assetId,
    this.name,
    this.typeIsCrypto,
    this.dataQuoteStart,
    this.dataQuoteEnd,
    this.dataOrderbookStart,
    this.dataOrderbookEnd,
    this.dataTradeStart,
    this.dataTradeEnd,
    this.dataSymbolsCount,
    this.volume1HrsUsd,
    this.volume1DayUsd,
    this.volume1MthUsd,
    this.idIcon,
    this.dataStart,
    this.dataEnd,
    this.priceUsd,
  });

  String? assetId;
  String? name;
  int? typeIsCrypto;
  DateTime? dataQuoteStart;
  DateTime? dataQuoteEnd;
  DateTime? dataOrderbookStart;
  DateTime? dataOrderbookEnd;
  DateTime? dataTradeStart;
  DateTime? dataTradeEnd;
  int? dataSymbolsCount;
  double? volume1HrsUsd;
  double? volume1DayUsd;
  double? volume1MthUsd;
  String? idIcon;
  DateTime? dataStart;
  DateTime? dataEnd;
  double? priceUsd;

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        assetId: json["asset_id"],
        name: json["name"],
        typeIsCrypto: json["type_is_crypto"],
        dataQuoteStart: json["data_quote_start"] == null ? null : DateTime.parse(json["data_quote_start"]),
        dataQuoteEnd: json["data_quote_end"] == null ? null : DateTime.parse(json["data_quote_end"]),
        dataOrderbookStart: json["data_orderbook_start"] == null ? null : DateTime.parse(json["data_orderbook_start"]),
        dataOrderbookEnd: json["data_orderbook_end"] == null ? null : DateTime.parse(json["data_orderbook_end"]),
        dataTradeStart: json["data_trade_start"] == null ? null : DateTime.parse(json["data_trade_start"]),
        dataTradeEnd: json["data_trade_end"] == null ? null : DateTime.parse(json["data_trade_end"]),
        dataSymbolsCount: json["data_symbols_count"],
        volume1HrsUsd: json["volume_1hrs_usd"].toDouble(),
        volume1DayUsd: json["volume_1day_usd"].toDouble(),
        volume1MthUsd: json["volume_1mth_usd"].toDouble(),
        idIcon: json["id_icon"],
        dataStart: json["data_start"] == null ? null : DateTime.parse(json["data_start"]),
        dataEnd: json["data_end"] == null ? null : DateTime.parse(json["data_end"]),
        priceUsd: json["price_usd"],
      );
}
