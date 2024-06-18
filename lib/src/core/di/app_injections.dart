import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:sport_portal/src/core/network/dio_helper.dart';
import 'package:sport_portal/src/features/competitions/competitions/controller/competitions_controller.dart';
import 'package:sport_portal/src/features/tv_channel/controller/tv_channel_controller.dart';
import 'package:sport_portal/src/features/tv_translations/controller/tv_translations_controller.dart';

import '../../features/athletes/athletes/controller/athlete_controller.dart';
import '../../features/auth/account/controller/account_controller.dart';
import '../../features/auth/account/controller/account_status_controller.dart';
import '../../features/auth/login/controller/login_controller.dart';
import '../../features/auth/register/controller/register_controller.dart';
import '../../features/coaches/coaches/controller/coaches_controller.dart';
import '../../features/dashboard/controller/dashboard_controller.dart';
import '../../features/gyms/gyms/controller/gyms_controller.dart';
import '../../features/health_care/doctors/controller/health_care_controller.dart';
import '../../features/kinds_of_sport/controller/kinds_of_sport_controller.dart';
import '../../features/localization/app_localizations_gateway_hive/app_localizations_gateway_hive.dart';
import '../../features/localization/controller/localization_controller.dart';
import '../../features/localization/localizations_use_case/localizations_use_case.dart';
import '../../features/news/news/controllers/local_news/news_controller.dart';
import '../../features/news/news/controllers/video_news/video_news_controller.dart';
import '../../features/news/news/controllers/world_news/world_news_controller.dart';
import '../../features/tv_translations/data/repository/tv_translations_repository.dart';
import '../../theme/controller/theme_controller.dart';
import '../../theme/gateway/theme_gateway_hive.dart';
import '../../theme/use_case/theme_use_case.dart';

class AppInjections {
  static Future<void> registerInjections(Box configBox) async {
    final getIt = GetIt.instance;

    /// Register theme controller
    getIt.registerSingleton<ThemeGatewayHive>(ThemeGatewayHive(configBox));
    getIt.registerSingleton<ThemeUseCaseImpl>(ThemeUseCaseImpl(getIt()));
    getIt.registerSingleton<ThemeController>(ThemeController(getIt()));

    /// Register localization controller
    getIt.registerSingleton<AppLocalizationsGatewayHive>(
        AppLocalizationsGatewayHive(configBox));
    getIt.registerSingleton<LocalizationsUseCaseImpl>(
        LocalizationsUseCaseImpl(getIt()));
    getIt.registerSingleton<LocalizationsController>(
        LocalizationsController(getIt()));
    getIt.registerSingleton<Dio>(DioHelper.instance);

    getIt.registerSingleton<DashboardController>(DashboardController());

    getIt.registerSingleton<AccountStatusController>(AccountStatusController());
    getIt.registerSingleton<AccountController>(AccountController());

    // -- repositories --

    ///Tv Translations repository
    getIt.registerSingleton<TvTranslationsRepository>(
        TvTranslationsRepository(getIt<Dio>()));

    // -- factories --

    ///Gyms controller
    getIt.registerFactory<GymsController>(() => GymsController());

    /// Auth controllers
    getIt.registerFactory<RegisterController>(() => RegisterController());
    getIt.registerFactory<LoginController>(() => LoginController());

    /// Competitions controller
    getIt.registerFactory<CompetitionsController>(
        () => CompetitionsController());

    /// News controllers
    getIt.registerFactory<NewsController>(() => NewsController());
    getIt.registerFactory<WorldNewsController>(() => WorldNewsController());
    getIt.registerFactory<VideoNewsController>(() => VideoNewsController());

    /// Kinds of Sport controllers
    getIt.registerFactory<KindsOfSportController>(
        () => KindsOfSportController());

    /// Coaches list controllers
    getIt.registerFactory<CoachesController>(() => CoachesController());

    /// Athletes list controllers
    getIt.registerFactory<AthletesController>(() => AthletesController());

    /// Health Care list controllers
    getIt.registerFactory<HealthCareController>(() => HealthCareController());

    /// TV Translations controllers
    getIt.registerSingleton<TvTranslationsController>(
        TvTranslationsController());

    /// TV Translations controllers
    getIt.registerSingleton<TvChannelController>(
        TvChannelController());
  }
}
