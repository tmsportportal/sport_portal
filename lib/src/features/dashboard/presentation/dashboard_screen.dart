import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:sport_portal/src/features/home/presentation/home_screen.dart';
import 'package:sport_portal/src/features/settings/presentation/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const route = r'/';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _dashboardController = GetIt.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async {
          return _dashboardController.willPop();
        },
        child: SafeArea(
          child: Observer(builder: (context) {
            return IndexedStack(
              index: _dashboardController.currentIndex,
              children: const [
                HomeScreen(),
                // ShopScreen(),
                // ShopScreen(),
                SettingsScreen(),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return NavigationBar(
          elevation: 0.0,
          selectedIndex: _dashboardController.currentIndex,
          height: 65.0,
          onDestinationSelected: (index) {
            _dashboardController.updateCurrentIndex(index);
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home),
              selectedIcon: const Icon(Icons.home),
              label: context.loc.home,
            ),
            // NavigationDestination(
            //   icon: const Icon(Icons.shopping_bag_outlined),
            //   selectedIcon: const Icon(Icons.shopping_bag),
            //   label: context.loc.home,
            // ),
            // NavigationDestination(
            //   icon: const Icon(Icons.shopping_bag_outlined),
            //   selectedIcon: const Icon(Icons.shopping_bag),
            //   label: context.loc.home,
            // ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: context.loc.settings,
            ),
          ],
        );
      }),
    );
  }
}
