import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_portal/src/features/dashboard/presentation/dashboard_screen.dart';

import 'core/l10n/l10n.dart';
import 'features/localization/controller/localization_controller.dart';
import 'theme/controller/theme_controller.dart';
import 'theme/presentation/app_theme.dart';
import 'utils/app_navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future googleFontsPending;
  final ThemeController _themeController = GetIt.instance();
  final LocalizationsController _localizationsController = GetIt.instance();

  @override
  void initState() {
    try {
      googleFontsPending = GoogleFonts.pendingFonts([GoogleFonts.poppins()]);
    } on Exception catch (e) {
      log(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Sport portal',
        debugShowCheckedModeBanner: false,
        themeMode: _themeController.themeMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: DashboardScreen.route,
        localizationsDelegates: L10n.appDelegates,
        supportedLocales: L10n.supportedLocales,
        locale: _localizationsController.locale,
        onGenerateRoute: (settings) => AppNavigation.configRoutes(settings),
        home: const DashboardScreen(),
      );
    });
  }
}
