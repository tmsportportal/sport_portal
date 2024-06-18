class FilterDto {
  final String? name;
  final List<dynamic>? filters;

  FilterDto({
    this.name,
    this.filters,
  });

  factory FilterDto.fromJson(Map<String, dynamic> json) => FilterDto(
        name: json["name"],
        filters: json["filters"] == null
            ? []
            : List<dynamic>.from(json["filters"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "filters":
            filters == null ? [] : List<dynamic>.from(filters!.map((x) => x)),
      };
}
