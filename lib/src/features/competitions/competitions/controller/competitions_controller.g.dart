// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competitions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompetitionsController on _CompetitionsControllerBase, Store {
  late final _$_competitionsAtom =
      Atom(name: '_CompetitionsControllerBase._competitions', context: context);

  ObservableFuture<List<CompetitionListDto>>? get competitions {
    _$_competitionsAtom.reportRead();
    return super._competitions;
  }

  @override
  ObservableFuture<List<CompetitionListDto>>? get _competitions => competitions;

  @override
  set _competitions(ObservableFuture<List<CompetitionListDto>>? value) {
    _$_competitionsAtom.reportWrite(value, super._competitions, () {
      super._competitions = value;
    });
  }

  late final _$_filtersAtom =
      Atom(name: '_CompetitionsControllerBase._filters', context: context);

  ObservableFuture<List<FilterDto>>? get filters {
    _$_filtersAtom.reportRead();
    return super._filters;
  }

  @override
  ObservableFuture<List<FilterDto>>? get _filters => filters;

  @override
  set _filters(ObservableFuture<List<FilterDto>>? value) {
    _$_filtersAtom.reportWrite(value, super._filters, () {
      super._filters = value;
    });
  }

  late final _$filtersMapAtom =
      Atom(name: '_CompetitionsControllerBase.filtersMap', context: context);

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

  late final _$dateAtom =
      Atom(name: '_CompetitionsControllerBase.date', context: context);

  @override
  DateTimeRange? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTimeRange? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_CompetitionsControllerBase.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$fetchSearchDataAsyncAction = AsyncAction(
      '_CompetitionsControllerBase.fetchSearchData',
      context: context);

  @override
  Future<void> fetchSearchData(String? name) {
    return _$fetchSearchDataAsyncAction.run(() => super.fetchSearchData(name));
  }

  late final _$_CompetitionsControllerBaseActionController =
      ActionController(name: '_CompetitionsControllerBase', context: context);

  @override
  void updatePickerDate(DateTimeRange? pickedDate) {
    final _$actionInfo = _$_CompetitionsControllerBaseActionController
        .startAction(name: '_CompetitionsControllerBase.updatePickerDate');
    try {
      return super.updatePickerDate(pickedDate);
    } finally {
      _$_CompetitionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchFilters() {
    final _$actionInfo = _$_CompetitionsControllerBaseActionController
        .startAction(name: '_CompetitionsControllerBase.fetchFilters');
    try {
      return super.fetchFilters();
    } finally {
      _$_CompetitionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String key, String value) {
    final _$actionInfo = _$_CompetitionsControllerBaseActionController
        .startAction(name: '_CompetitionsControllerBase.addFilter');
    try {
      return super.addFilter(key, value);
    } finally {
      _$_CompetitionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchFilteredData() {
    final _$actionInfo = _$_CompetitionsControllerBaseActionController
        .startAction(name: '_CompetitionsControllerBase.fetchFilteredData');
    try {
      return super.fetchFilteredData();
    } finally {
      _$_CompetitionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_CompetitionsControllerBaseActionController
        .startAction(name: '_CompetitionsControllerBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_CompetitionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtersMap: ${filtersMap},
date: ${date}
    ''';
  }
}
