// import 'dart:convert';

import 'dart:convert';

class Welcome {
  final List<Property> property;

  Welcome({
    required this.property,
  });

  Welcome copyWith({
    List<Property>? property,
  }) =>
      Welcome(
        property: property ?? this.property,
      );

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        property: List<Property>.from(
            json["property"].map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "property": List<dynamic>.from(property.map((x) => x.toJson())),
      };
}

class Property {
  final int id;
  final String name;
  final String type;
  final String typeAr;
  final String location;
  final double area;
  final String details;
  final String status;
  final DateTime createdDate;
  final List<String> images;

  Property({
    required this.id,
    required this.name,
    required this.type,
    required this.typeAr,
    required this.location,
    required this.area,
    required this.details,
    required this.status,
    required this.createdDate,
    required this.images,
  });

  Property copyWith({
    int? id,
    String? name,
    String? type,
    String? typeAr,
    String? location,
    double? area,
    String? details,
    String? status,
    DateTime? createdDate,
    List<String>? images,
  }) =>
      Property(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        typeAr: typeAr ?? this.typeAr,
        location: location ?? this.location,
        area: area ?? this.area,
        details: details ?? this.details,
        status: status ?? this.status,
        createdDate: createdDate ?? this.createdDate,
        images: images ?? this.images,
      );

  factory Property.fromRawJson(String str) =>
      Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: int.parse(json["id"]),
        name: json["name"],
        type: json["type"],
        typeAr: json["type_ar"],
        location: json["location"],
        area: json["area"]==0?0.0:double.parse(json["area"]),
        details: json["details"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "type_ar": typeAr,
        "location": location,
        "area": area,
        "details": details,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}









// class Property {
//     final int id;
//     final String name;
//     final String type;
//     final String typeAr;
//     final String location;
//     final String details;
//     final String status;
//     final DateTime createdDate;
//     final List<String> images;
//     final List<Unit> units;

//     Property({
//         required this.id,
//         required this.name,
//         required this.type,
//         required this.typeAr,
//         required this.location,
//         required this.details,
//         required this.status,
//         required this.createdDate,
//         required this.images,
//         required this.units,
//     });

//     Property copyWith({
//         int? id,
//         String? name,
//         String? type,
//         String? typeAr,
//         String? location,
//         String? details,
//         String? status,
//         DateTime? createdDate,
//         List<String>? images,
//         List<Unit>? units,
//     }) => 
//         Property(
//             id: id ?? this.id,
//             name: name ?? this.name,
//             type: type ?? this.type,
//             typeAr: typeAr ?? this.typeAr,
//             location: location ?? this.location,
//             details: details ?? this.details,
//             status: status ?? this.status,
//             createdDate: createdDate ?? this.createdDate,
//             images: images ?? this.images,
//             units: units ?? this.units,
//         );
//     factory Property.fromRawJson(String str) => Property.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Property.fromJson(Map<String, dynamic> json) => Property(
//         id: json["id"],
//         name: json["name"],
//         type: json["type"],
//         typeAr: json["type_ar"],
//         location: json["location"],
//         details: json["details"],
//         status: json["status"],
//         createdDate: DateTime.parse(json["created_date"]),
//         images: List<String>.from(json["images"].map((x) => x)),
//         units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "type": type,
//         "type_ar": typeAr,
//         "location": location,
//         "details": details,
//         "status": status,
//         "created_date": createdDate.toIso8601String(),
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "units": List<dynamic>.from(units.map((x) => x.toJson())),
//     };
// }

// class Unit {
//     final int id;
//     final int propertyId;
//     final String name;
//     final String details;
//     final int lowPrice;
//     final int highPrice;
//     final double size;
//     final int typeId;
//     final String status;
//     final DateTime createdDate;
//     final List<String> images;

//     Unit({
//         required this.id,
//         required this.propertyId,
//         required this.name,
//         required this.details,
//         required this.lowPrice,
//         required this.highPrice,
//         required this.size,
//         required this.typeId,
//         required this.status,
//         required this.createdDate,
//         required this.images,
//     });

//     Unit copyWith({
//         int? id,
//         int? propertyId,
//         String? name,
//         String? details,
//         int? lowPrice,
//         int? highPrice,
//         double? size,
//         int? typeId,
//         String? status,
//         DateTime? createdDate,
//         List<String>? images,
//     }) => 
//         Unit(
//             id: id ?? this.id,
//             propertyId: propertyId ?? this.propertyId,
//             name: name ?? this.name,
//             details: details ?? this.details,
//             lowPrice: lowPrice ?? this.lowPrice,
//             highPrice: highPrice ?? this.highPrice,
//             size: size ?? this.size,
//             typeId: typeId ?? this.typeId,
//             status: status ?? this.status,
//             createdDate: createdDate ?? this.createdDate,
//             images: images ?? this.images,
//         );

//     factory Unit.fromRawJson(String str) => Unit.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Unit.fromJson(Map<String, dynamic> json) => Unit(
//         id: json["id"],
//         propertyId: json["property_id"],
//         name: json["name"],
//         details: json["details"],
//         lowPrice: json["low_price"],
//         highPrice: json["high_price"],
//         size: json["size"]?.toDouble(),
//         typeId: json["type_id"],
//         status: json["status"],
//         createdDate: DateTime.parse(json["created_date"]),
//         images: List<String>.from(json["images"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "property_id": propertyId,
//         "name": name,
//         "details": details,
//         "low_price": lowPrice,
//         "high_price": highPrice,
//         "size": size,
//         "type_id": typeId,
//         "status": status,
//         "created_date": createdDate.toIso8601String(),
//         "images": List<dynamic>.from(images.map((x) => x)),
//     };
// }
