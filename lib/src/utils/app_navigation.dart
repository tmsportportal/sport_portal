import 'package:flutter/material.dart';
import 'package:sport_portal/src/features/about/presentation/about_us_screen.dart';
import 'package:sport_portal/src/features/tv_translations/presentation/tv_translations_screen.dart';

import '../features/athletes/athlete/presentation/athlete_screen.dart';
import '../features/athletes/athletes/presentation/athletes_screen.dart';
import '../features/athletes/athletes_list/presentation/athletes_list.dart';
import '../features/auth/login/presentation/login_screen.dart';
import '../features/auth/register/presentation/register_screen.dart';
import '../features/coaches/coach/presentation/coach_screen.dart';
import '../features/coaches/coaches/presentation/coaches_screen.dart';
import '../features/coaches/coaches_list/presentation/coaches_list_screen.dart';
import '../features/competitions/competition/presentation/competition_screen.dart';
import '../features/competitions/competitions/presentation/competitions_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/gyms/gym/presentation/gym_screen.dart';
import '../features/gyms/gyms/presentation/gyms_screen.dart';
import '../features/health_care/doctor/presentation/doctor_screen.dart';
import '../features/health_care/doctors/presentation/doctors_screen.dart';
import '../features/health_care/doctors_list/presentation/doctors_list_screen.dart';
import '../features/kinds_of_sport/presentation/kinds_of_sport.dart';
import '../features/news/news/presentation/news_screen/news_screen.dart';
import '../features/news/news_item/presentation/news_item_screen.dart';
import '../features/news/video_news_item/presentation/video_news_item_screen.dart';
import '../features/product/presentation/product_screen.dart';
import '../features/results/national_results/presentation/national_results_screen.dart';
import '../features/results/world_results/presentation/world_results_screen.dart';

class AppNavigation {
  static Route<Widget>? configRoutes(RouteSettings settings) {
    Widget screen = const SizedBox();
    switch (settings.name) {
      case DashboardScreen.route:
        screen = const DashboardScreen();
        break;
      case CoachesScreen.route:
        screen = const CoachesScreen();
        break;
      case AthletesScreen.route:
        screen = const AthletesScreen();
        break;
      case DoctorsScreen.route:
        screen = const DoctorsScreen();
        break;
      case KindsOfSportScreen.route:
        screen = const KindsOfSportScreen();
        break;
      case NewsScreen.route:
        screen = const NewsScreen();
        break;
      case NationalResultsScreen.route:
        screen = const NationalResultsScreen();
        break;
      case WorldResultsScreen.route:
        screen = const WorldResultsScreen();
        break;
      case GymsScreen.route:
        screen = const GymsScreen();
        break;
      case CompetitionsScreen.route:
        screen = const CompetitionsScreen();
        break;

      case LoginScreen.route:
        screen = const LoginScreen();
        break;
      case RegisterScreen.route:
        screen = const RegisterScreen();
        break;
      case AboutUsScreen.route:
        screen = const AboutUsScreen();
        break;
      case GymScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = GymScreen(
          gym: arguments['gym'],
        );
        break;
      case ProductScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = ProductScreen(
          id: arguments['id'],
        );
        break;
      case CompetitionScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = CompetitionScreen(
          competition: arguments['competition'],
        );
        break;

      case NewsItemScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = NewsItemScreen(
          newsItem: arguments['newsItem'],
        );
        break;
      case VideoNewsItemScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = VideoNewsItemScreen(
          newsItem: arguments['newsItem'],
        );
        break;
      case AthleteScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = AthleteScreen(
          athlete: arguments['athlete'],
        );
        break;
      case CoachScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = CoachScreen(
          coach: arguments['coach'],
        );
        break;
      case DoctorScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = DoctorScreen(
          doctor: arguments['doctor'],
        );
        break;
      case CoachesListScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = CoachesListScreen(
          id: arguments['category_id'],
        );
        break;
      case AthletesListScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = AthletesListScreen(
          id: arguments['category_id'],
        );
        break;
      case DoctorsListScreen.route:
        final arguments = settings.arguments as Map<String, dynamic>;
        screen = DoctorsListScreen(
          id: arguments['category_id'],
        );
        break;
      case TvTranslationsScreen.route:
        // final arguments = settings.arguments as Map<String, dynamic>;
        screen = const TvTranslationsScreen();
        break;
    }
    return MaterialPageRoute<Widget>(builder: (context) => screen);
  }
}
