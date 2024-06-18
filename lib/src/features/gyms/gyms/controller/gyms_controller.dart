import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/gyms/gyms/data/repository/gyms_repository.dart';
import 'package:sport_portal/src/features/localization/controller/localization_controller.dart';

import '../data/dto/filter_dto.dart';
import '../data/dto/gyms_dto.dart';

part 'gyms_controller.g.dart';

class GymsController = _GymsControllerBase with _$GymsController;

abstract class _GymsControllerBase with Store {
  final mapController = MapController();
  final textEditingController = TextEditingController();
  final focus = FocusNode();

  @observable
  double mapHeight = 250.0;

  final _api = GymsRepository();

  final _langController = GetIt.instance<LocalizationsController>();

  @observable
  double currentZoom = 9.0;

  @observable
  var filtersMap = ObservableMap<String, String>();

  @readonly
  ObservableFuture<List<GymDto>>? _gymsList;

  @readonly
  ObservableFuture<List<FilterDto>>? _filters;

  @action
  void changeMapHeight(double size) {
    if(mapHeight == 250.0) {
      mapHeight = size;
    } else {
      mapHeight = 250.0;
    }
  }

  @action
  void fetchFilters() {
    try {
      final future = _api.getFilters(_langController.getLocaleName());
      _filters = ObservableFuture(future);
    } catch (e) {
      _filters = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  void addFilter(String key, String value) {
    filtersMap[key] = value;
  }

  @action
  void incrementZoom() {
    if (currentZoom < 18) {
      currentZoom++;
    }
    mapController.move(mapController.center, currentZoom);
  }

  @action
  void decrementZoom() {
    if (currentZoom > 1) {
      currentZoom--;
    }

    mapController.move(mapController.center, currentZoom);
  }

  @action
  void fetchFilteredData() {
    try {
      _gymsList = ObservableFuture(
          _api.getGymsWithFilters(_langController.getLocaleName(), filtersMap));
    } catch (e) {
      _gymsList = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  void onSearchTapped() {
    focus.unfocus();
    if (textEditingController.text.isNotEmpty) {
      filtersMap['name'] = textEditingController.text;
      fetchFilteredData();
    }
  }

  @action
  void fetchData() {
    try {
      final future = _api.getGyms(_langController.getLocaleName());
      _gymsList = ObservableFuture(future);
    } catch (e) {
      _gymsList = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  void clearFilters() {
    textEditingController.clear();
    filtersMap.clear();
    fetchData();
  }

  void onClearTapped() {
    focus.unfocus();
    textEditingController.clear();
    fetchData();
  }

  void disposeControllers() {
    mapController.dispose();
    textEditingController.dispose();
    focus.dispose();
  }
}
