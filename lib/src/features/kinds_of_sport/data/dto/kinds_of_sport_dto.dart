class KindsOfSportDto {
  final String? id;
  final String? nameTm;
  final String? nameRu;
  final String? imagePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Fsports? fsports;
  final String? name;

  KindsOfSportDto({
    this.id,
    this.nameTm,
    this.nameRu,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.fsports,
    this.name,
  });

  factory KindsOfSportDto.fromJson(Map<String, dynamic> json) =>
      KindsOfSportDto(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        imagePath: json["imagePath"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        fsports:
            json["fsports"] == null ? null : Fsports.fromJson(json["fsports"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "imagePath": imagePath,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "fsports": fsports?.toJson(),
        "name": name,
      };
}

class Fsports {
  final String? id;
  final String? tel;
  final String? fax;
  final String? web;
  final String? email;
  final String? leaderTm;
  final String? leaderRu;
  final int? founded;
  final String? locationTm;
  final String? locationRu;
  final String? presidentTm;
  final String? presidentRu;
  final String? federationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? leader;
  final String? location;
  final String? president;

  Fsports({
    this.id,
    this.tel,
    this.fax,
    this.web,
    this.email,
    this.leaderTm,
    this.leaderRu,
    this.founded,
    this.locationTm,
    this.locationRu,
    this.presidentTm,
    this.presidentRu,
    this.federationId,
    this.createdAt,
    this.updatedAt,
    this.leader,
    this.location,
    this.president,
  });

  factory Fsports.fromJson(Map<String, dynamic> json) => Fsports(
        id: json["id"],
        tel: json["tel"],
        fax: json["fax"],
        web: json["web"],
        email: json["email"],
        leaderTm: json["leaderTm"],
        leaderRu: json["leaderRu"],
        founded: json["founded"],
        locationTm: json["locationTm"],
        locationRu: json["locationRu"],
        presidentTm: json["presidentTm"],
        presidentRu: json["presidentRu"],
        federationId: json["federationId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        leader: json["leader"],
        location: json["location"],
        president: json["president"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tel": tel,
        "fax": fax,
        "web": web,
        "email": email,
        "leaderTm": leaderTm,
        "leaderRu": leaderRu,
        "founded": founded,
        "locationTm": locationTm,
        "locationRu": locationRu,
        "presidentTm": presidentTm,
        "presidentRu": presidentRu,
        "federationId": federationId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "leader": leader,
        "location": location,
        "president": president,
      };
}
