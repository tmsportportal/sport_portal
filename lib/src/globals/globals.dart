import '../features/comments/model/comment_Model.dart';
import '../features/home/models/home_category_model.dart';
import '../features/results/models/club_result_model.dart';
import '../features/results/models/league_model.dart';

/// home categories list
const homeCategoriesList = <HomeCategoryModel>[
  HomeCategoryModel(
      id: 3,
      title: 'sportNews',
      type: CategoriesEnum.sportNews,
      image: r'assets/images/8.png',
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  HomeCategoryModel(
      id: 0,
      title: 'kindsOfSport',
      type: CategoriesEnum.kindsOfSport,
      image: r'assets/images/1.png',
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  HomeCategoryModel(
      id: 1,
      title: "coaches",
      type: CategoriesEnum.coaches,
      image: r'assets/images/2.png',
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  HomeCategoryModel(
      id: 2,
      title: "athletes",
      type: CategoriesEnum.athletes,
      image: r'assets/images/3.png',
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  HomeCategoryModel(
      id: 4,
      title: r'gyms',
      image: r'assets/images/4.png',
      type: CategoriesEnum.gyms,
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  // HomeCategoryModel(
  //     id: 5,
  //     title: 'healthCare',
  //     image: r'assets/images/5.png',
  //     type: CategoriesEnum.healthCare,
  //     description:
  //         r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  // HomeCategoryModel(
  //     id: 6,
  //     title: r'properNutrition',
  //     image: r'assets/images/6.png',
  //     type: CategoriesEnum.properNutrition,
  //     description:
  //         r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  // HomeCategoryModel(
  //     id: 7,
  //     title: r'shops',
  //     image: r'assets/images/7.png',
  //     type: CategoriesEnum.shops,
  //     description:
  //         r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  HomeCategoryModel(
      id: 8,
      title: r'competitions',
      image: r'assets/images/9.png',
      type: CategoriesEnum.competitions,
      description:
          r'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
];

/// comments list
final comments = <Comment>[
  Comment(
      0,
      'Esse incididunt fugiat occaecat eiusmod occaecat Lorem dolor irure aute. Do pariatur fugiat exercitation laborum quis exercitation proident nostrud do. Deserunt sint magna sunt proident quis laboris sint adipisicing adipisicing deserunt laboris ad veniam cupidatat.',
      5,
      'Aman Amanow',
      DateTime(2023, 8, 12)),
  Comment(
      1,
      'Incididunt excepteur velit consequat excepteur ex laboris pariatur et sint nostrud aliqua non.',
      2,
      'Aman Amanow',
      DateTime(2023, 8, 3)),
  Comment(
      2,
      'Ullamco culpa adipisicing ad duis aute ea ea et proident tempor elit sint eu.',
      4,
      'Aman Amanow',
      DateTime(2023, 7, 27)),
  Comment(
      3,
      'Nisi incididunt officia enim aliquip excepteur ullamco elit ullamco dolor.',
      1,
      'Aman Amanow',
      DateTime.now()),
];

/// club results (table) list
final clubResults = <ClubResultModel>[
  ClubResultModel(
      id: 0,
      club: 'Liverpool',
      clubLogo: '',
      wins: 5,
      draws: 3,
      loses: 2,
      conceded: 3,
      scored: 16),
  ClubResultModel(
      id: 1,
      club: 'Man City',
      clubLogo: '',
      wins: 4,
      draws: 5,
      loses: 1,
      conceded: 9,
      scored: 17),
  ClubResultModel(
      id: 2,
      club: 'Man United',
      clubLogo: '',
      wins: 3,
      draws: 3,
      loses: 4,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Arsenal',
      clubLogo: '',
      wins: 5,
      draws: 1,
      loses: 4,
      conceded: 9,
      scored: 15),
  ClubResultModel(
      id: 2,
      club: 'Everton',
      clubLogo: '',
      wins: 2,
      draws: 1,
      loses: 4,
      conceded: 15,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Aston Villa',
      clubLogo: '',
      wins: 3,
      draws: 3,
      loses: 4,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Tottenham',
      clubLogo: '',
      wins: 3,
      draws: 3,
      loses: 4,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'West Ham',
      clubLogo: '',
      wins: 3,
      draws: 3,
      loses: 4,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Man United',
      clubLogo: '',
      wins: 3,
      draws: 3,
      loses: 4,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Chelsea',
      clubLogo: '',
      wins: 3,
      draws: 0,
      loses: 7,
      conceded: 17,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Newscastle United',
      clubLogo: '',
      wins: 4,
      draws: 4,
      loses: 2,
      conceded: 10,
      scored: 11),
  ClubResultModel(
      id: 2,
      club: 'Fullham',
      clubLogo: '',
      wins: 4,
      draws: 1,
      loses: 5,
      conceded: 12,
      scored: 10),
  ClubResultModel(
      id: 2,
      club: 'Burnley',
      clubLogo: '',
      wins: 1,
      draws: 1,
      loses: 8,
      conceded: 20,
      scored: 8),
  ClubResultModel(
      id: 2,
      club: 'Bournemouth',
      clubLogo: '',
      wins: 1,
      draws: 2,
      loses: 7,
      conceded: 19,
      scored: 7),
  ClubResultModel(
      id: 2,
      club: 'Wolves',
      clubLogo: '',
      wins: 3,
      draws: 1,
      loses: 6,
      conceded: 16,
      scored: 8),
];

/// turkmen clubs results (table) list
final tkLeagueResults = <ClubResultModel>[
  ClubResultModel(
    id: 0,
    club: 'Arkadag',
    clubLogo: '',
    wins: 10,
    draws: 0,
    loses: 0,
    scored: 36,
    conceded: 9,
  ),
  ClubResultModel(
    id: 1,
    club: 'Nebitçi',
    clubLogo: '',
    wins: 8,
    draws: 1,
    loses: 3,
    scored: 23,
    conceded: 12,
  ),
  ClubResultModel(
    id: 2,
    club: 'Altyn Asyr',
    clubLogo: '',
    wins: 7,
    draws: 2,
    loses: 2,
    scored: 25,
    conceded: 9,
  ),
  ClubResultModel(
    id: 3,
    club: 'Kopetdag',
    clubLogo: '',
    wins: 5,
    draws: 2,
    loses: 5,
    scored: 16,
    conceded: 11,
  ),
  ClubResultModel(
    id: 4,
    club: 'Aşgabat',
    clubLogo: '',
    wins: 4,
    draws: 1,
    loses: 6,
    scored: 14,
    conceded: 22,
  ),
  ClubResultModel(
    id: 5,
    club: 'Energetik Mary',
    clubLogo: '',
    wins: 4,
    draws: 0,
    loses: 7,
    scored: 10,
    conceded: 21,
  ),
  ClubResultModel(
    id: 6,
    club: 'Şagadam',
    clubLogo: '',
    wins: 2,
    draws: 2,
    loses: 8,
    scored: 8,
    conceded: 21,
  ),
  ClubResultModel(
    id: 7,
    club: 'Ahal',
    clubLogo: '',
    wins: 2,
    draws: 1,
    loses: 7,
    scored: 9,
    conceded: 18,
  ),
  ClubResultModel(
    id: 8,
    club: 'Merw',
    clubLogo: '',
    wins: 1,
    draws: 3,
    loses: 5,
    scored: 8,
    conceded: 15,
  ),
];

/// football leagues
const leagues = <LeagueModel>[
  LeagueModel(
      id: 0,
      title: 'English Premier League',
      image:
          'https://banner2.cleanpng.com/20180711/vg/kisspng-201617-premier-league-english-football-league-l-lion-emoji-5b460f06eeac18.5589169115313180229776.jpg'),
  LeagueModel(
      id: 1,
      title: 'La Liga',
      image:
          'https://banner2.cleanpng.com/20180614/xhx/kisspng-la-liga-premier-league-spain-real-madrid-c-f-fc-b-5b227efbcc4059.7808010715289873878366.jpg'),
  LeagueModel(
      id: 2,
      title: 'Bundesliga',
      image:
          'https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Bundesliga_logo_%282017%29.svg/1200px-Bundesliga_logo_%282017%29.svg.png'),
  LeagueModel(
      id: 3,
      title: 'Serie A',
      image: 'https://www.fifplay.com/img/public/serie-a-logo-transparent.png'),
];