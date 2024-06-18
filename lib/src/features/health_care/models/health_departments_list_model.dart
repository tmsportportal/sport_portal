class HealthDepartmentsListModel {
  final int id;
  final String title;
  final String? image;

  const HealthDepartmentsListModel({
    required this.id,
    required this.title,
    this.image,
  });
}
