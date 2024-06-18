class FederationCoachesDto {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CoachDto>? ftrainers;
  final String? name;
  final String? imagePath;

  FederationCoachesDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.ftrainers,
    this.name,
    this.imagePath,
  });

  factory FederationCoachesDto.fromJson(Map<String, dynamic> json) =>
      FederationCoachesDto(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        ftrainers: json["ftrainers"] == null
            ? []
            : List<CoachDto>.from(
                json["ftrainers"]!.map((x) => CoachDto.fromJson(x))),
        name: json["name"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "ftrainers": ftrainers == null
            ? []
            : List<dynamic>.from(ftrainers!.map((x) => x.toJson())),
        "name": name,
      };
}

class CoachDto {
  final String? id;
  final int? age;
  final String? job;
  final String? name;
  final String? made;
  final double? rating;
  final String? imagePath;
  final int? experience;
  final int? views;
  final String? birthPlace;
  final String? sportLevel;
  final List<String>? workedAt;
  final List<String>? badges;
  final String? links;
  final String? federationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CoachDto({
    this.id,
    this.age,
    this.job,
    this.name,
    this.made,
    this.rating,
    this.imagePath,
    this.experience,
    this.views,
    this.birthPlace,
    this.sportLevel,
    this.workedAt,
    this.badges,
    this.links,
    this.federationId,
    this.createdAt,
    this.updatedAt,
  });

  factory CoachDto.fromJson(Map<String, dynamic> json) => CoachDto(
        id: json["id"],
        age: json["age"],
        job: json["job"],
        name: json["name"],
        made: json["made"],
        rating: json["rating"]?.toDouble(),
        imagePath: json["imagePath"],
        experience: json["experience"],
        views: json["views"],
        birthPlace: json["birthPlace"],
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
        "age": age,
        "job": job,
        "name": name,
        "made": made,
        "rating": rating,
        "imagePath": imagePath,
        "experience": experience,
        "views": views,
        "birthPlace": birthPlace,
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
