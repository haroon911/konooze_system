import 'dart:convert';

class UnitSales {
  final List<UnitSale> unitSales;

  UnitSales({
    required this.unitSales,
  });

  UnitSales copyWith({
    List<UnitSale>? unitSales,
  }) =>
      UnitSales(
        unitSales: unitSales ?? this.unitSales,
      );

  factory UnitSales.fromRawJson(String str) =>
      UnitSales.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UnitSales.fromJson(Map<String, dynamic> json) => UnitSales(
        unitSales: List<UnitSale>.from(
            json["data"].map((x) => UnitSale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(unitSales.map((x) => x.toJson())),
      };
}

class UnitSale {
  final String salesId;
  final String agentName;
  final String salesStatus;
  final DateTime salesDate;
  final String company;
  final String clientBrand;
  final String clientName;

  UnitSale({
    required this.salesId,
    required this.agentName,
    required this.salesStatus,
    required this.salesDate,
    required this.company,
    required this.clientBrand,
    required this.clientName,
  });

  UnitSale copyWith({
    String? salesId,
    String? agentName,
    String? salesStatus,
    DateTime? salesDate,
    String? company,
    String? clientBrand,
    String? clientName,
  }) =>
      UnitSale(
        salesId: salesId ?? this.salesId,
        agentName: agentName ?? this.agentName,
        salesStatus: salesStatus ?? this.salesStatus,
        salesDate: salesDate ?? this.salesDate,
        company: company ?? this.company,
        clientBrand: clientBrand ?? this.clientBrand,
        clientName: clientName ?? this.clientName,
      );

  factory UnitSale.fromRawJson(String str) =>
      UnitSale.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UnitSale.fromJson(Map<String, dynamic> json) => UnitSale(
        salesId: json["sales_id"] ?? 'none',
        agentName: json["agent_name"] ?? 'none',
        salesStatus: json["sales_status"] ?? 'none',
        salesDate: json["sales_date"] != null
            ? DateTime.parse(json["sales_date"])
            : DateTime.now(),
        company: json["company"] ?? 'none',
        clientBrand: json["client_brand"] ?? 'none',
        clientName: json["client_name"] ?? 'none',
      );
  Map<String, dynamic> toJson() => {
        "sales_id": salesId,
        "agent_name": agentName,
        "sales_status": salesStatus,
        "sales_date": salesDate.toIso8601String(),
        "company": company,
        "client_brand": clientBrand,
        "client_name": clientName,
      };
}
