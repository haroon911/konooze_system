import 'dart:convert';

class PropertyUnits {
  final List<PropertyUnit> units;

  PropertyUnits({
    required this.units,
  });

  PropertyUnits copyWith({
    List<PropertyUnit>? units,
  }) =>
      PropertyUnits(
        units: units ?? this.units,
      );

  factory PropertyUnits.fromRawJson(String str) => PropertyUnits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertyUnits.fromJson(Map<String, dynamic> json) => PropertyUnits(
        units: List<PropertyUnit>.from(
            json["units"].map((x) => PropertyUnit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
      };
}

class PropertyUnit {
  final int id;
  final int propertyId;
  final String name;
  final String details;
  final double lowPrice;
  final double highPrice;
  final double length;
  final double width;
  final double size;
  final int typeId;
  final String status;
  final DateTime createdDate;
  final String type;

  PropertyUnit({
    required this.id,
    required this.propertyId,
    required this.name,
    required this.details,
    required this.lowPrice,
    required this.highPrice,
    required this.length,
    required this.width,
    required this.size,
    required this.typeId,
    required this.status,
    required this.createdDate,
    required this.type,
  });

  PropertyUnit copyWith({
    int? id,
    int? propertyId,
    String? name,
    String? details,
    double? lowPrice,
    double? highPrice,
    double? length,
    double? width,
    double? size,
    int? typeId,
    String? status,
    DateTime? createdDate,
    String? type,
  }) =>
      PropertyUnit(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        name: name ?? this.name,
        details: details ?? this.details,
        lowPrice: lowPrice ?? this.lowPrice,
        highPrice: highPrice ?? this.highPrice,
        length: length ?? this.length,
        width: width ?? this.width,
        size: size ?? this.size,
        typeId: typeId ?? this.typeId,
        status: status ?? this.status,
        createdDate: createdDate ?? this.createdDate,
        type: type ?? this.type,
      );

  factory PropertyUnit.fromRawJson(String str) =>
      PropertyUnit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertyUnit.fromJson(Map<String, dynamic> json) => PropertyUnit(
        id: int.parse(json["id"]),
        propertyId: int.parse(json["property_id"]),
        name: json["name"],
        details: json["details"],
        lowPrice: double.parse(json["low_price"]),
        highPrice: double.parse(json["high_price"]),
        length: double.parse(json["length"]),
        width: double.parse(json["width"]),
        size: double.parse(json["size"]),
        typeId: int.parse(json["type_id"]),
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_id": propertyId,
        "name": name,
        "details": details,
        "low_price": lowPrice,
        "high_price": highPrice,
        "length": length,
        "width": width,
        "size": size,
        "type_id": typeId,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "type": type,
      };
}
