import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../localization/controller/localization_controller.dart';
import '../../data/dto/news_filter_dto.dart';
import '../../data/dto/news_list_dto.dart';
import '../../data/repository/news_repository.dart';

part 'world_news_controller.g.dart';

class WorldNewsController = _WorldNewsControllerBase with _$WorldNewsController;

abstract class _WorldNewsControllerBase with Store {
  final _repository = NewsRepository();

  @readonly
  ObservableFuture<List<NewsListDto>> _news = ObservableFuture.value([]);

  final _langController = GetIt.instance<LocalizationsController>();

  @observable
  var filtersMap = ObservableMap<String, String>();

  @readonly
  ObservableFuture<NewsFilterDto>? _filters;

  @computed
  bool get isNewsEmpty => _news.value == null || (_news.value?.isEmpty ?? true);

  @action
  void fetchFilters() {
    try {
      final future = _repository.getFilters(
          _langController.getLocaleName(), Section.World);
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

  void init() {
    // addListener();
    fetchNews();
    fetchFilters();
  }

  @action
  Future<void> fetchNews() async {
    try {
      _news = ObservableFuture(
          _repository.getWorldNews(_langController.getLocaleName()));
    } catch (e) {
      _news = ObservableFuture.error(e);
      debugPrint(_news.error);
    }
  }

  @action
  Future<void> fetchFilteredNews() async {
    try {
      final future = _repository.getFilteredWorldNews(
          _langController.getLocaleName(), filtersMap);
      _news = ObservableFuture(future);
    } catch (e) {
      _news = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  void clearFilters() {
    if (filtersMap.isNotEmpty) {
      filtersMap.clear();
      fetchNews();
    }
  }
}
