import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../gyms/gyms/data/dto/filter_dto.dart';
import '../../../localization/controller/localization_controller.dart';
import '../data/dto/competition_list_dto.dart';
import '../data/repository/competitions_repository.dart';

part 'competitions_controller.g.dart';

class CompetitionsController = _CompetitionsControllerBase
    with _$CompetitionsController;

abstract class _CompetitionsControllerBase with Store {
  final _repository = CompetitionsRepository();
  final textEditingController = TextEditingController();
  final focus = FocusNode();

  void disposeControllers() {
    textEditingController.dispose();
    focus.dispose();
  }

  final _langController = GetIt.instance<LocalizationsController>();

  @readonly
  ObservableFuture<List<CompetitionListDto>>? _competitions;

  @readonly
  ObservableFuture<List<FilterDto>>? _filters;

  @observable
  var filtersMap = ObservableMap<String, String>();

  @observable
  DateTimeRange? date;

  @action
  void updatePickerDate(DateTimeRange? pickedDate) {
    date = pickedDate;
    filtersMap.addAll({
      'startDate': date?.start.toString() ?? '',
      'endDate': date?.end.toString() ?? '',
    });
    fetchFilteredData();
  }

  @action
  Future<void> fetchData() async {
    try {
      _competitions = ObservableFuture(
          _repository.getCompetitions(_langController.getLocaleName()));
    } catch (e) {
      _competitions = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> fetchSearchData(String? name) async {
    try {
      _competitions = ObservableFuture(_repository.getCompetitionsSearch(
          _langController.getLocaleName(), name));
    } catch (e) {
      _competitions = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  void fetchFilters() {
    try {
      final future = _repository.getFilters(_langController.getLocaleName());
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
  void fetchFilteredData() {
    try {
      _competitions = ObservableFuture(_repository.getCompetitionsWithFilters(
          _langController.getLocaleName(), filtersMap));
    } catch (e) {
      _competitions = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  void onSearchTapped() {
    focus.unfocus();
    if (textEditingController.text.isNotEmpty) {
      fetchSearchData(textEditingController.text);
    }
  }

  void onClearTapped() {
    focus.unfocus();
    if (textEditingController.text.isNotEmpty) {
      textEditingController.clear();
      fetchData();
    }
  }

  @action
  void clearFilters() {
    focus.unfocus();
    textEditingController.clear();
    filtersMap.clear();
    fetchData();
  }
}
