import 'dart:convert';

class Clients {
  final List<Client> clients;

  Clients({
    required this.clients,
  });

  Clients copyWith({
    List<Client>? clients,
  }) =>
      Clients(
        clients: clients ?? this.clients,
      );

  factory Clients.fromRawJson(String str) => Clients.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        clients:
            List<Client>.from(json["clients"].map((x) => Client.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clients": List<dynamic>.from(clients.map((x) => x.toJson())),
      };
}

class Client {
  final int id;
  final String company;
  final String brand;
  final String mobile;
  final String type;
  final String email;
  final String address;
  final String clientName;
  final String agentName;
  final String imageUrl;
  final String details;
  final DateTime createdDate;
  final String shared;

  Client({
    required this.id,
    required this.company,
    required this.brand,
    required this.mobile,
    required this.type,
    required this.email,
    required this.address,
    required this.clientName,
    required this.agentName,
    required this.imageUrl,
    required this.details,
    required this.createdDate,
    required this.shared,
  });

  Client copyWith({
    int? id,
    String? company,
    String? brand,
    String? mobile,
    String? type,
    String? email,
    String? address,
    String? clientName,
    String? agentName,
    String? imageUrl,
    String? details,
    String? shared,
    DateTime? createdDate,
  }) =>
      Client(
        id: id ?? this.id,
        company: company ?? this.company,
        brand: brand ?? this.brand,
        mobile: mobile ?? this.mobile,
        type: type ?? this.type,
        email: email ?? this.email,
        address: address ?? this.address,
        clientName: clientName ?? this.clientName,
        agentName: agentName ?? this.agentName,
        imageUrl: imageUrl ?? this.imageUrl,
        details: details ?? this.details,
        createdDate: createdDate ?? this.createdDate,
        shared: shared ?? this.shared,
      );

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: int.parse(json["id"]),
        company: json["company"],
        brand: json["brand"],
        mobile: json["mobile"],
        type: json["type"],
        email: json["email"],
        address: json["address"],
        clientName: json["client_name"],
        agentName: json["agent_name"],
        imageUrl: json["image_url"],
        details: json["details"],
        createdDate: DateTime.parse(json["created_date"]),
        shared: json["shared"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "brand": brand,
        "mobile": mobile,
        "type": type,
        "email": email,
        "address": address,
        "client_name": clientName,
        "agent_name": agentName,
        "image_url": imageUrl,
        "details": details,
        "created_date": createdDate.toIso8601String(),
        "shared": shared,
      };
}
