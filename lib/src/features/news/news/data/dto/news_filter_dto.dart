class NewsFilterDto {
  final String? name;
  final List<Filter>? filters;

  NewsFilterDto({
    this.name,
    this.filters,
  });

  factory NewsFilterDto.fromJson(Map<String, dynamic> json) => NewsFilterDto(
        name: json["name"],
        filters: json["filters"] == null
            ? []
            : List<Filter>.from(
                json["filters"]!.map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "filters": filters == null
            ? []
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
      };
}

class Filter {
  final String? id;
  final String? nameTm;
  final String? nameRu;
  final Section? section;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  Filter({
    this.id,
    this.nameTm,
    this.nameRu,
    this.section,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        section: sectionValues.map[json["section"]]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "section": sectionValues.reverse[section],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
      };
}

enum Section {
  Video,
  Local,
  World,
}

final sectionValues = EnumValues(
    {"Video": Section.Video, "Local": Section.Local, "World": Section.World});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
