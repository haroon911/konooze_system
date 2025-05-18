import 'dart:convert';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final int? roleId;
  final int? jobId;
  final String? phoneNumber;
  final String? info;
  final String? imageUrl;
  final DateTime? createdDate;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.jobId,
    this.phoneNumber,
    this.info,
    this.imageUrl,
    this.createdDate,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    int? roleId,
    int? jobId,
    String? phoneNumber,
    String? info,
    String? imageUrl,
    DateTime? createdDate,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        roleId: roleId ?? this.roleId,
        jobId: jobId ?? this.jobId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        info: info ?? this.info,
        imageUrl: imageUrl ?? this.imageUrl,
        createdDate: createdDate ?? this.createdDate,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : int.tryParse(json["id"].toString()),
        name: json["name"],
        email: json["email"],
        roleId: json["role_id"] == null
            ? null
            : int.tryParse(json["role_id"].toString()),
        jobId: json["job_id"] == null
            ? null
            : int.tryParse(json["job_id"].toString()),
        phoneNumber: json["phone_number"],
        info: json["info"],
        imageUrl: json["image_url"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.tryParse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role_id": roleId,
        "job_id": jobId,
        "phone_number": phoneNumber,
        "info": info,
        "image_url": imageUrl,
        "created_date": createdDate?.toIso8601String(),
      };
}
