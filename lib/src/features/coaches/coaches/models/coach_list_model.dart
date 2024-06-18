class CoachListModel {
  final int id;
  final String name;
  final String image;
  final String sportType;
  final String? position;
  final String? club;
  final String? clubLogo;
  final double rating;
  final CoachType coachType;

  const CoachListModel({
    required this.id,
    required this.name,
    required this.image,
    required this.sportType,
    this.position,
    this.club,
    this.clubLogo,
    required this.rating,
    required this.coachType,
  });
}

enum CoachType { national, u23, none }
