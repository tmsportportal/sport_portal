// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../localization/controller/localization_controller.dart';
import '../data/dto/federation_athletes_dto.dart';
import '../data/repository/athletes_repository.dart';

part 'athlete_controller.g.dart';

class AthletesController = _AthletesControllerBase with _$AthletesController;

abstract class _AthletesControllerBase with Store {
  final _repository = AthletesRepository();

  @readonly
  ObservableFuture<List<FederationAthletesDto>>? _athletesList;

  final _langController = GetIt.instance<LocalizationsController>();

  @action
  void fetchAthletes() {
    try {
      final future = _repository.getAthletes(_langController.getLocaleName());
      _athletesList = ObservableFuture(future);
    } catch (e) {
      _athletesList = ObservableFuture.error(e);

      debugPrint('$e');
    }
  }
}
