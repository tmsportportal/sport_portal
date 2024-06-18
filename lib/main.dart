import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_portal/src/core/di/app_injections.dart';
import 'package:sport_portal/src/core/local/key_value_storage_base.dart';
import 'package:sport_portal/src/features/auth/account/controller/account_controller.dart';

import 'src/app.dart';
import 'src/features/localization/controller/localization_controller.dart';
import 'src/theme/controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  GoogleFonts.config.allowRuntimeFetching = false;
  
  await Hive.initFlutter();
  final configBox = await Hive.openBox('app_config');
  
  await KeyValueStorageBase.init();
  await AppInjections.registerInjections(configBox);
  await GetIt.instance<ThemeController>().getThemeMode();
  await GetIt.instance<LocalizationsController>().fetchLocale();
  await GetIt.instance<AccountController>().getAccount();

  runApp(const MyApp());
}
