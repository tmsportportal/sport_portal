class GymModel {
  final int id;
  final String title;
  final List<String> images;
  final String address;
  final List<String> phoneNumbers;
  final String? email;
  final String? url;
  final List<String> sportTypes;
  final String workTime;
  final String workDays;
  final int? coachesCount;
  final int? athleteCount;

  const GymModel({
    required this.id,
    required this.title,
    required this.images,
    required this.address,
    required this.phoneNumbers,
    this.email,
    this.url,
    required this.sportTypes,
    required this.workTime,
    required this.workDays,
    this.coachesCount,
    this.athleteCount,
  });
}
