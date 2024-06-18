class HomeCategoryModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final CategoriesEnum type;

  const HomeCategoryModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.description,
      required this.type});
}

enum CategoriesEnum {
  kindsOfSport,
  coaches,
  athletes,
  gyms,
  healthCare,
  sportNews,
  competitions,
  shops,
  properNutrition
}
