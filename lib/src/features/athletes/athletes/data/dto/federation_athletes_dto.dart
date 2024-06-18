class FederationAthletesDto {
  final String? id;
  final String? nameTm;
  final String? nameRu;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AthleteDto>? fathlete;
  final String? name;
  final String? imagePath;

  FederationAthletesDto({
    this.id,
    this.nameTm,
    this.nameRu,
    this.createdAt,
    this.updatedAt,
    this.fathlete,
    this.name,
    this.imagePath,
  });

  factory FederationAthletesDto.fromJson(Map<String, dynamic> json) =>
      FederationAthletesDto(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        fathlete: json["fathlete"] == null
            ? []
            : List<AthleteDto>.from(
                json["fathlete"]!.map((x) => AthleteDto.fromJson(x))),
        name: json["name"],
        imagePath: json['imagePath'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "fathlete": fathlete == null
            ? []
            : List<dynamic>.from(fathlete!.map((x) => x.toJson())),
        "name": name,
      };
}

class AthleteDto {
  final String? id;
  final String? name;
  final String? club;
  final String? made;
  final double? rating;
  final String? position;
  final String? imagePath;
  final int? age;
  final String? birthPlace;
  final int? views;
  final int? experience;
  final String? sportLevel;
  final List<String>? workedAt;
  final List<String>? badges;
  final String? links;
  final String? federationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AthleteDto({
    this.id,
    this.name,
    this.club,
    this.made,
    this.rating,
    this.position,
    this.imagePath,
    this.age,
    this.birthPlace,
    this.views,
    this.experience,
    this.sportLevel,
    this.workedAt,
    this.badges,
    this.links,
    this.federationId,
    this.createdAt,
    this.updatedAt,
  });

  factory AthleteDto.fromJson(Map<String, dynamic> json) => AthleteDto(
        id: json["id"],
        name: json["name"],
        club: json["club"],
        made: json["made"],
        rating: json["rating"]?.toDouble(),
        position: json["position"],
        imagePath: json["imagePath"],
        age: json["age"],
        birthPlace: json["birthPlace"],
        views: json["views"],
        experience: json["experience"],
        sportLevel: json["sportLevel"],
        workedAt: json["workedAt"] == null
            ? []
            : List<String>.from(json["workedAt"]!.map((x) => x)),
        badges: json["badges"] == null
            ? []
            : List<String>.from(json["badges"]!.map((x) => x)),
        links: json["links"],
        federationId: json["federationId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "club": club,
        "made": made,
        "rating": rating,
        "position": position,
        "imagePath": imagePath,
        "age": age,
        "birthPlace": birthPlace,
        "views": views,
        "experience": experience,
        "sportLevel": sportLevel,
        "workedAt":
            workedAt == null ? [] : List<dynamic>.from(workedAt!.map((x) => x)),
        "badges":
            badges == null ? [] : List<dynamic>.from(badges!.map((x) => x)),
        "links": links,
        "federationId": federationId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
