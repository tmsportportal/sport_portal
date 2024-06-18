// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoNewsController on _VideoNewsControllerBase, Store {
  late final _$_newsAtom =
      Atom(name: '_VideoNewsControllerBase._news', context: context);

  ObservableFuture<List<VideoNewsListDto>> get news {
    _$_newsAtom.reportRead();
    return super._news;
  }

  @override
  ObservableFuture<List<VideoNewsListDto>> get _news => news;

  @override
  set _news(ObservableFuture<List<VideoNewsListDto>> value) {
    _$_newsAtom.reportWrite(value, super._news, () {
      super._news = value;
    });
  }

  late final _$filtersMapAtom =
      Atom(name: '_VideoNewsControllerBase.filtersMap', context: context);

  @override
  ObservableMap<String, String> get filtersMap {
    _$filtersMapAtom.reportRead();
    return super.filtersMap;
  }

  @override
  set filtersMap(ObservableMap<String, String> value) {
    _$filtersMapAtom.reportWrite(value, super.filtersMap, () {
      super.filtersMap = value;
    });
  }

  late final _$_filtersAtom =
      Atom(name: '_VideoNewsControllerBase._filters', context: context);

  ObservableFuture<NewsFilterDto>? get filters {
    _$_filtersAtom.reportRead();
    return super._filters;
  }

  @override
  ObservableFuture<NewsFilterDto>? get _filters => filters;

  @override
  set _filters(ObservableFuture<NewsFilterDto>? value) {
    _$_filtersAtom.reportWrite(value, super._filters, () {
      super._filters = value;
    });
  }

  late final _$fetchNewsAsyncAction =
      AsyncAction('_VideoNewsControllerBase.fetchNews', context: context);

  @override
  Future<void> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  late final _$fetchFilteredNewsAsyncAction = AsyncAction(
      '_VideoNewsControllerBase.fetchFilteredNews',
      context: context);

  @override
  Future<void> fetchFilteredNews() {
    return _$fetchFilteredNewsAsyncAction.run(() => super.fetchFilteredNews());
  }

  late final _$_VideoNewsControllerBaseActionController =
      ActionController(name: '_VideoNewsControllerBase', context: context);

  @override
  void fetchFilters() {
    final _$actionInfo = _$_VideoNewsControllerBaseActionController.startAction(
        name: '_VideoNewsControllerBase.fetchFilters');
    try {
      return super.fetchFilters();
    } finally {
      _$_VideoNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String key, String value) {
    final _$actionInfo = _$_VideoNewsControllerBaseActionController.startAction(
        name: '_VideoNewsControllerBase.addFilter');
    try {
      return super.addFilter(key, value);
    } finally {
      _$_VideoNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_VideoNewsControllerBaseActionController.startAction(
        name: '_VideoNewsControllerBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_VideoNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtersMap: ${filtersMap}
    ''';
  }
}
