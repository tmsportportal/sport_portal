class HealthCareDto {
  final String? id;
  final String? nameTm;
  final String? nameRu;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Employee>? employees;
  final String? name;

  HealthCareDto({
    this.id,
    this.nameTm,
    this.nameRu,
    this.createdAt,
    this.updatedAt,
    this.employees,
    this.name,
  });

  factory HealthCareDto.fromJson(Map<String, dynamic> json) => HealthCareDto(
        id: json["id"],
        nameTm: json["nameTm"],
        nameRu: json["nameRu"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        employees: json["employees"] == null
            ? []
            : List<Employee>.from(
                json["employees"]!.map((x) => Employee.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTm": nameTm,
        "nameRu": nameRu,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "employees": employees == null
            ? []
            : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "name": name,
      };
}

class Employee {
  final String? id;
  final String? name;
  final String? job;
  final int? age;
  final String? workAt;
  final String? departmentId;
  final int? experience;
  final int? views;
  final double? rating;
  final String? imagePath;
  final String? links;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Employee({
    this.id,
    this.name,
    this.job,
    this.age,
    this.workAt,
    this.departmentId,
    this.experience,
    this.views,
    this.rating,
    this.imagePath,
    this.links,
    this.createdAt,
    this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        job: json["job"],
        age: json["age"],
        workAt: json["workAt"],
        departmentId: json["departmentId"],
        experience: json["experience"],
        views: json["views"],
        rating: json["rating"]?.toDouble(),
        imagePath: json["imagePath"],
        links: json["links"],
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
        "job": job,
        "age": age,
        "workAt": workAt,
        "departmentId": departmentId,
        "experience": experience,
        "views": views,
        "rating": rating,
        "imagePath": imagePath,
        "links": links,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
