import 'dart:convert';

class UserModel {
    final int id;
    final String name;
    final String email;
    final String password;
    final int roleId;
    final int jobId;
    final String phoneNumber;
    final String info;
    final String imageUrl;
    final DateTime createdDate;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.roleId,
        required this.jobId,
        required this.phoneNumber,
        required this.info,
        required this.imageUrl,
        required this.createdDate,
    });

    UserModel copyWith({
        int? id,
        String? name,
        String? email,
        String? password,
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
            password: password ?? this.password,
            roleId: roleId ?? this.roleId,
            jobId: jobId ?? this.jobId,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            info: info ?? this.info,
            imageUrl: imageUrl ?? this.imageUrl,
            createdDate: createdDate ?? this.createdDate,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: int.parse(json["id"]),
        name: json["name"],
        email: json["email"],
        password: json["password"],
        roleId: int.parse(json["role_id"]),
        jobId: int.parse(json["job_id"]),
        phoneNumber: json["phone_number"],
        info: json["info"],
        imageUrl: json["image_url"],
        createdDate: DateTime.parse(json["created_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "role_id": roleId,
        "job_id": jobId,
        "phone_number": phoneNumber,
        "info": info,
        "image_url": imageUrl,
        "created_date": createdDate.toIso8601String(),
    };
}