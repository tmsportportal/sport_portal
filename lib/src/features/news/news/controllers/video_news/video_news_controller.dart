import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../localization/controller/localization_controller.dart';
import '../../data/dto/news_filter_dto.dart';
import '../../data/dto/video_news_list_dto.dart';
import '../../data/repository/news_repository.dart';

part 'video_news_controller.g.dart';

class VideoNewsController = _VideoNewsControllerBase with _$VideoNewsController;

abstract class _VideoNewsControllerBase with Store {
  final _repository = NewsRepository();

  @readonly
  ObservableFuture<List<VideoNewsListDto>> _news = ObservableFuture.value([]);

  final _langController = GetIt.instance<LocalizationsController>();

  @observable
  var filtersMap = ObservableMap<String, String>();

  @readonly
  ObservableFuture<NewsFilterDto>? _filters;

  @action
  void fetchFilters() {
    try {
      final future = _repository.getFilters(
          _langController.getLocaleName(), Section.Video);
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
          _repository.getVideoNews(_langController.getLocaleName()));
    } catch (e) {
      _news = ObservableFuture.error(e);
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> fetchFilteredNews() async {
    try {
      final future = _repository.getFilteredVideoNews(
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
