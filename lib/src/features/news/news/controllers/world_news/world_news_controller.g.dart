// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorldNewsController on _WorldNewsControllerBase, Store {
  Computed<bool>? _$isNewsEmptyComputed;

  @override
  bool get isNewsEmpty =>
      (_$isNewsEmptyComputed ??= Computed<bool>(() => super.isNewsEmpty,
              name: '_WorldNewsControllerBase.isNewsEmpty'))
          .value;

  late final _$_newsAtom =
      Atom(name: '_WorldNewsControllerBase._news', context: context);

  ObservableFuture<List<NewsListDto>> get news {
    _$_newsAtom.reportRead();
    return super._news;
  }

  @override
  ObservableFuture<List<NewsListDto>> get _news => news;

  @override
  set _news(ObservableFuture<List<NewsListDto>> value) {
    _$_newsAtom.reportWrite(value, super._news, () {
      super._news = value;
    });
  }

  late final _$filtersMapAtom =
      Atom(name: '_WorldNewsControllerBase.filtersMap', context: context);

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
      Atom(name: '_WorldNewsControllerBase._filters', context: context);

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
      AsyncAction('_WorldNewsControllerBase.fetchNews', context: context);

  @override
  Future<void> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  late final _$fetchFilteredNewsAsyncAction = AsyncAction(
      '_WorldNewsControllerBase.fetchFilteredNews',
      context: context);

  @override
  Future<void> fetchFilteredNews() {
    return _$fetchFilteredNewsAsyncAction.run(() => super.fetchFilteredNews());
  }

  late final _$_WorldNewsControllerBaseActionController =
      ActionController(name: '_WorldNewsControllerBase', context: context);

  @override
  void fetchFilters() {
    final _$actionInfo = _$_WorldNewsControllerBaseActionController.startAction(
        name: '_WorldNewsControllerBase.fetchFilters');
    try {
      return super.fetchFilters();
    } finally {
      _$_WorldNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String key, String value) {
    final _$actionInfo = _$_WorldNewsControllerBaseActionController.startAction(
        name: '_WorldNewsControllerBase.addFilter');
    try {
      return super.addFilter(key, value);
    } finally {
      _$_WorldNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_WorldNewsControllerBaseActionController.startAction(
        name: '_WorldNewsControllerBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_WorldNewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtersMap: ${filtersMap},
isNewsEmpty: ${isNewsEmpty}
    ''';
  }
}
