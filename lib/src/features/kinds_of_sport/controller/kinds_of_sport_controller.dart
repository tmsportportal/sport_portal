import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/kinds_of_sport/data/repository/kinds_of_sport_repository.dart';

import '../../localization/controller/localization_controller.dart';
import '../data/dto/kinds_of_sport_dto.dart';

part 'kinds_of_sport_controller.g.dart';

class KindsOfSportController = _KindsOfSportControllerBase
    with _$KindsOfSportController;

abstract class _KindsOfSportControllerBase with Store {
  final _api = KindsOfSportRepository();
  final _langController = GetIt.instance<LocalizationsController>();

  @readonly
  ObservableFuture<List<KindsOfSportDto>> _federations =
      ObservableFuture.value([]);

  @action
  Future<void> fetchData() async {
    try {
      _federations =
          ObservableFuture(_api.fetchData(_langController.getLocaleName()));
    } catch (e) {
      _federations = ObservableFuture.error(e);
    }
  }
}
