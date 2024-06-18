class CompetitionListDto {
  final String? id;
  final String? location;
  final int? views;
  final String? imagePath;
  final int? typeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final CompetitionType? competitionType;
  final String? name;
  final String? text;

  CompetitionListDto({
    this.id,
    this.location,
    this.views,
    this.imagePath,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.dateStart,
    this.dateEnd,
    this.competitionType,
    this.name,
    this.text,
  });

  factory CompetitionListDto.fromJson(Map<String, dynamic> json) =>
      CompetitionListDto(
        id: json["id"],
        name: json["name"],
        text: json["text"],
        location: json["location"],
        views: json["views"],
        imagePath: json["imagePath"],
        typeId: json["typeId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        dateStart: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        dateEnd:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        competitionType: json["competitionType"] == null
            ? null
            : CompetitionType.fromJson(json["competitionType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "views": views,
        "imagePath": imagePath,
        "typeId": typeId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "competitionType": competitionType?.toJson(),
      };
}

class CompetitionType {
  final int? id;
  final String? nameTm;
  final String? nameRu;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CompetitionType({
    this.id,
    this.nameTm,
    this.nameRu,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CompetitionType.fromJson(Map<String, dynamic> json) =>
      CompetitionType(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
