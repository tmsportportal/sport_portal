class ChannelDto {
  final String? id;
  final String? name;
  final List<dynamic>? altNames;
  final dynamic network;
  final List<dynamic>? owners;
  final String? country;
  final dynamic subdivision;
  final String? city;
  final List<String>? broadcastArea;
  final List<String>? languages;
  final List<String>? categories;
  final bool? isNsfw;
  final dynamic launched;
  final dynamic closed;
  final dynamic replacedBy;
  final String? website;
  final String? logo;

  ChannelDto({
    this.id,
    this.name,
    this.altNames,
    this.network,
    this.owners,
    this.country,
    this.subdivision,
    this.city,
    this.broadcastArea,
    this.languages,
    this.categories,
    this.isNsfw,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logo,
  });

  factory ChannelDto.fromJson(Map<String, dynamic> json) => ChannelDto(
        id: json["id"],
        name: json["name"],
        altNames: json["alt_names"] == null
            ? []
            : List<dynamic>.from(json["alt_names"]!.map((x) => x)),
        network: json["network"],
        owners: json["owners"] == null
            ? []
            : List<dynamic>.from(json["owners"]!.map((x) => x)),
        country: json["country"],
        subdivision: json["subdivision"],
        city: json["city"],
        broadcastArea: json["broadcast_area"] == null
            ? []
            : List<String>.from(json["broadcast_area"]!.map((x) => x)),
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        isNsfw: json["is_nsfw"],
        launched: json["launched"],
        closed: json["closed"],
        replacedBy: json["replaced_by"],
        website: json["website"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alt_names":
            altNames == null ? [] : List<dynamic>.from(altNames!.map((x) => x)),
        "network": network,
        "owners":
            owners == null ? [] : List<dynamic>.from(owners!.map((x) => x)),
        "country": country,
        "subdivision": subdivision,
        "city": city,
        "broadcast_area": broadcastArea == null
            ? []
            : List<dynamic>.from(broadcastArea!.map((x) => x)),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "is_nsfw": isNsfw,
        "launched": launched,
        "closed": closed,
        "replaced_by": replacedBy,
        "website": website,
        "logo": logo,
      };
}

class ChannelDtoWithUrls {
  final String? id;
  final String? name;
  final String? logo;
  final String? country;
  final String? city;
  final List<String?> urls;

  const ChannelDtoWithUrls({
    required this.id,
    required this.name,
    required this.logo,
    required this.country,
    required this.city,
    required this.urls,
  });
}
