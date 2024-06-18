import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/core/l10n/l10n.dart';
import 'package:sport_portal/src/features/about/presentation/about_us_screen.dart';
import 'package:sport_portal/src/features/auth/account/controller/account_controller.dart';
import 'package:sport_portal/src/features/auth/account/controller/account_status_controller.dart';
import 'package:sport_portal/src/features/localization/controller/localization_controller.dart';

import '../../../theme/controller/theme_controller.dart';
import '../../auth/login/presentation/login_screen.dart';
import '../../auth/register/presentation/register_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _themeController = GetIt.instance<ThemeController>();
  final _localizationsController = GetIt.instance<LocalizationsController>();

  final _accountStatusController = GetIt.instance<AccountStatusController>();

  final _accountController = GetIt.instance<AccountController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(context.loc.settings),
          leading: IconButton(
            onPressed: () {
              _onLangTapped(context);
            },
            icon: const Icon(Icons.language_rounded),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5.0),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.light_mode_rounded),
                    ),
                    // const SizedBox(width: 5.0),
                    Observer(builder: (context) {
                      return Switch(
                          value: _themeController.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            _themeController
                                .switchThemeMode(Theme.of(context).brightness);
                          });
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(height: 10.0),
          Observer(builder: (context) {
            if (_accountStatusController.accountLoginStatus ==
                AccountLoginStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_accountStatusController.accountLoginStatus ==
                AccountLoginStatus.notLoggedIn) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.route);
                    },
                    title: Text(context.loc.login),
                    leading: const Icon(Icons.login_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.route);
                    },
                    title: Text(context.loc.register),
                    leading: const Icon(Icons.account_box_rounded),
                  ),
                ],
              );
            }
            if (_accountStatusController.accountLoginStatus ==
                AccountLoginStatus.loggedIn) {
              final account = _accountController.observableAccount.value;
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: Colors.black38,
                      ),
                    ),
                    title: Text(account?.firstName ?? ''),
                    subtitle: Text(account?.email ?? ''),
                  ),
                  ListTile(
                    onTap: () {
                      _accountController.logout();
                    },
                    leading: Icon(
                      Icons.logout_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    title: Text(
                      context.loc.logout,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          }),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutUsScreen.route);
            },
            title: Text(context.loc.aboutUs),
            leading: const Icon(Icons.info_outline_rounded),
          ),
        ])),
      ],
    );
  }

  Future<void> _onLangTapped(BuildContext context) async {
    final theme = Theme.of(context);
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 5.0,
                  constraints: const BoxConstraints(maxWidth: 80.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (context) => ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var locale in L10n.supportedLocales)
                        RadioListTile.adaptive(
                          value: locale,
                          onChanged: (value) {
                            _localizationsController
                                .updateLocale(value ?? const Locale('ru'));
                          },
                          groupValue: _localizationsController.locale,
                          title: Text(context.loc.locale(locale.languageCode)),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
