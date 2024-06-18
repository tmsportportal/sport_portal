import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/health_care/doctors/data/dto/health_care_dto.dart';
import 'package:sport_portal/src/features/health_care/doctors/data/repository/health_care_repository.dart';
import 'package:sport_portal/src/features/localization/controller/localization_controller.dart';

part 'health_care_controller.g.dart';

class HealthCareController = _HealthCareControllerBase
    with _$HealthCareController;

abstract class _HealthCareControllerBase with Store {
  final _api = HealthCareRepository();

  static final ObservableFuture<List<HealthCareDto>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<HealthCareDto>> healthCareList = emptyResponse;

  final _langController = GetIt.instance<LocalizationsController>();

  @action
  void fetchHealthCare() {
    try {
      final future = _api.getHealthCare(_langController.getLocaleName());
      healthCareList = ObservableFuture(future);
    } catch (e) {
      healthCareList = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }
}
