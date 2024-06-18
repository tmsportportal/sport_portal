class GymDto {
  final String? id;
  final String? nameTm;
  final String? nameRu;
  final String? locationTm;
  final String? location;
  final String? email;
  final String? link;
  final int? views;
  final double? latitude;
  final double? longitude;
  final List<String>? tel;
  final List<String>? sports;
  final List<String>? sportsRu;
  final List<String>? openAt;
  final List<String>? openAtRu;
  final String? imagePath1;
  final String? imagePath2;
  final String? imagePath3;
  final String? imagePath4;
  final String? imagePath5;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  GymDto({
    this.id,
    this.nameTm,
    this.nameRu,
    this.locationTm,
    this.location,
    this.email,
    this.link,
    this.views,
    this.latitude,
    this.longitude,
    this.tel,
    this.sports,
    this.sportsRu,
    this.openAt,
    this.openAtRu,
    this.imagePath1,
    this.imagePath2,
    this.imagePath3,
    this.imagePath4,
    this.imagePath5,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory GymDto.fromJson(Map<String, dynamic> json) => GymDto(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        locationTm: json["locationTm"],
        location: json["location"],
        email: json["email"],
        link: json["link"],
        views: json["views"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        tel: json["tel"] == null
            ? []
            : List<String>.from(json["tel"]!.map((x) => x)),
        sports: json["sports"] == null
            ? []
            : List<String>.from(json["sports"]!.map((x) => x)),
        sportsRu: json["sportsRu"] == null
            ? []
            : List<String>.from(json["sportsRu"]!.map((x) => x)),
        openAt: json["openAt"] == null
            ? []
            : List<String>.from(json["openAt"]!.map((x) => x)),
        openAtRu: json["openAtRu"] == null
            ? []
            : List<String>.from(json["openAtRu"]!.map((x) => x)),
        imagePath1: json["imagePath1"],
        imagePath2: json["imagePath2"],
        imagePath3: json["imagePath3"],
        imagePath4: json["imagePath4"],
        imagePath5: json["imagePath5"],
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
        "locationTm": locationTm,
        "location": location,
        "email": email,
        "link": link,
        "views": views,
        "latitude": latitude,
        "longitude": longitude,
        "tel": tel == null ? [] : List<dynamic>.from(tel!.map((x) => x)),
        "sports":
            sports == null ? [] : List<dynamic>.from(sports!.map((x) => x)),
        "sportsRu":
            sportsRu == null ? [] : List<dynamic>.from(sportsRu!.map((x) => x)),
        "openAtTm":
            openAt == null ? [] : List<dynamic>.from(openAt!.map((x) => x)),
        "openAtRu":
            openAtRu == null ? [] : List<dynamic>.from(openAtRu!.map((x) => x)),
        "imagePath1": imagePath1,
        "imagePath2": imagePath2,
        "imagePath3": imagePath3,
        "imagePath4": imagePath4,
        "imagePath5": imagePath5,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
      };
}
