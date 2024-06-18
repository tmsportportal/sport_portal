import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/news/news/data/dto/news_filter_dto.dart';
import 'package:sport_portal/src/features/news/news/data/dto/news_list_dto.dart';
import 'package:sport_portal/src/features/news/news/data/repository/news_repository.dart';

import '../../../../localization/controller/localization_controller.dart';

part 'news_controller.g.dart';

class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  final _repository = NewsRepository();

  @readonly
  ObservableFuture<List<NewsListDto>> _news = ObservableFuture.value([]);

  final _langController = GetIt.instance<LocalizationsController>();

  @observable
  var filtersMap = ObservableMap<String, String>();

  @readonly
  ObservableFuture<NewsFilterDto>? _filters;

  @action
  void fetchFilters() {
    try {
      final future = _repository.getFilters(
          _langController.getLocaleName(), Section.Local);
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
    fetchNews();
    fetchFilters();
  }

  @action
  Future<void> fetchNews() async {
    try {
      final future = _repository.getLocalNews(_langController.getLocaleName());
      _news = ObservableFuture(future);
    } catch (e) {
      _news = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> fetchFilteredNews() async {
    try {
      final future = _repository.getFilteredLocalNews(
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
