class ClubResultModel {
  final int id;
  final String club;
  final String clubLogo;
  late final int games;
  final int wins;
  final int draws;
  final int loses;
  late final int points;
  final int conceded;
  final int scored;

  ClubResultModel({
    required this.id,
    required this.club,
    required this.clubLogo,
    required this.wins,
    required this.draws,
    required this.loses,
    required this.conceded,
    required this.scored,
  }) {
    games = draws + wins + loses;
    points = (wins * 3) + draws;
  }
}
