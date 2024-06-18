// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gyms_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GymsController on _GymsControllerBase, Store {
  late final _$mapHeightAtom =
      Atom(name: '_GymsControllerBase.mapHeight', context: context);

  @override
  double get mapHeight {
    _$mapHeightAtom.reportRead();
    return super.mapHeight;
  }

  @override
  set mapHeight(double value) {
    _$mapHeightAtom.reportWrite(value, super.mapHeight, () {
      super.mapHeight = value;
    });
  }

  late final _$currentZoomAtom =
      Atom(name: '_GymsControllerBase.currentZoom', context: context);

  @override
  double get currentZoom {
    _$currentZoomAtom.reportRead();
    return super.currentZoom;
  }

  @override
  set currentZoom(double value) {
    _$currentZoomAtom.reportWrite(value, super.currentZoom, () {
      super.currentZoom = value;
    });
  }

  late final _$filtersMapAtom =
      Atom(name: '_GymsControllerBase.filtersMap', context: context);

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

  late final _$_gymsListAtom =
      Atom(name: '_GymsControllerBase._gymsList', context: context);

  ObservableFuture<List<GymDto>>? get gymsList {
    _$_gymsListAtom.reportRead();
    return super._gymsList;
  }

  @override
  ObservableFuture<List<GymDto>>? get _gymsList => gymsList;

  @override
  set _gymsList(ObservableFuture<List<GymDto>>? value) {
    _$_gymsListAtom.reportWrite(value, super._gymsList, () {
      super._gymsList = value;
    });
  }

  late final _$_filtersAtom =
      Atom(name: '_GymsControllerBase._filters', context: context);

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

  late final _$_GymsControllerBaseActionController =
      ActionController(name: '_GymsControllerBase', context: context);

  @override
  void changeMapHeight(double size) {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.changeMapHeight');
    try {
      return super.changeMapHeight(size);
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchFilters() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.fetchFilters');
    try {
      return super.fetchFilters();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String key, String value) {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.addFilter');
    try {
      return super.addFilter(key, value);
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementZoom() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.incrementZoom');
    try {
      return super.incrementZoom();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementZoom() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.decrementZoom');
    try {
      return super.decrementZoom();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchFilteredData() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.fetchFilteredData');
    try {
      return super.fetchFilteredData();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchData() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_GymsControllerBaseActionController.startAction(
        name: '_GymsControllerBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_GymsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapHeight: ${mapHeight},
currentZoom: ${currentZoom},
filtersMap: ${filtersMap}
    ''';
  }
}
