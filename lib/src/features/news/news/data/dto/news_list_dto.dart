class NewsListDto {
  final String? id;
  final String? textTm;
  final String? textRu;
  final int? views;

  // final String? nameTm;
  // final String? nameRu;
  final String? location;
  final String? imagePath;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category? category;
  final String? name;
  final String? text;

  NewsListDto({
    this.id,
    this.textTm,
    this.textRu,
    this.views,
    // this.nameTm,
    // this.nameRu,
    this.location,
    this.imagePath,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.name,
    this.text,
  });

  factory NewsListDto.fromJson(Map<String, dynamic> json) => NewsListDto(
        id: json["id"],
        textTm: json["textTm"],
        textRu: json["textRu"],
        views: json["views"],
        // nameTm: json["nameTm"],
        // nameRu: json["nameRu"],
        location: json["location"],
        imagePath: json["imagePath"],
        categoryId: json["categoryId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        name: json["name"],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "textTm": textTm,
        "textRu": textRu,
        "views": views,
        "location": location,
        "imagePath": imagePath,
        "categoryId": categoryId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
        "name": name,
        "text": text,
      };
}

class Category {
  final String? id;
  final String? name;
  final String? section;

  Category({
    this.id,
    this.name,
    this.section,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        section: json["section"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "section": section,
      };
}
