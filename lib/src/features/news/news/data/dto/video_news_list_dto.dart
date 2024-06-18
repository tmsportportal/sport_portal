class VideoNewsListDto {
  final String? id;
  final int? views;
  final String? nameTm;
  final String? nameRu;
  final String? textTm;
  final String? textRu;
  final String? videoPath;
  final String? imagePath;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  VideoNewsListDto({
    this.id,
    this.views,
    this.nameTm,
    this.nameRu,
    this.textTm,
    this.textRu,
    this.videoPath,
    this.imagePath,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory VideoNewsListDto.fromJson(Map<String, dynamic> json) =>
      VideoNewsListDto(
        id: json["id"],
        views: json["views"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        textTm: json["textTm"],
        textRu: json["textRu"],
        videoPath: json["videoPath"],
        imagePath: json["imagePath"],
        categoryId: json["categoryId"],
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
        "views": views,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "textTm": textTm,
        "textRu": textRu,
        "videoPath": videoPath,
        "imagePath": imagePath,
        "categoryId": categoryId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
      };
}
