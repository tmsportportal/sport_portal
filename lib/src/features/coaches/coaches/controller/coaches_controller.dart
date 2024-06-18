import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/localization/controller/localization_controller.dart';

import '../data/dto/federation_coaches.dart';
import '../data/repository/coaches_repository.dart';

part 'coaches_controller.g.dart';

class CoachesController = _CoachesControllerBase with _$CoachesController;

abstract class _CoachesControllerBase with Store {
  final _repository = CoachesRepository();

  @readonly
  ObservableFuture<List<FederationCoachesDto>>? _coachesList;

  final _langController = GetIt.instance<LocalizationsController>();

  @action
  void fetchCoaches() {
    try {
      final future = _repository.getCoaches(_langController.getLocaleName());
      _coachesList = ObservableFuture(future);
    } catch (e) {
      _coachesList = ObservableFuture.error(e);

      debugPrint('$e');
    }
  }
}
