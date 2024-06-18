class DoctorModel {
  final int id;
  final String name;
  final String image;
  final String department;
  final double rating;
  final int age;
  final int workingExperience;
  final List<String>? workPlaces;
  final String? workPlace;
  final String? position;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.department,
    required this.rating,
    required this.age,
    required this.workingExperience,
    this.workPlaces,
    this.workPlace,
    this.position,
  });
}
