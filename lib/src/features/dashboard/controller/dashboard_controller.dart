import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  Future<bool> willPop() async {
    if (currentIndex > 0) {
      currentIndex = 0;
      return false;
    }
    return true;
  }

  @action
  void updateCurrentIndex(int index) {
    if (currentIndex != index) {
      currentIndex = index;
    }
  }
}
