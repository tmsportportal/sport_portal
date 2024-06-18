// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinds_of_sport_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KindsOfSportController on _KindsOfSportControllerBase, Store {
  late final _$_federationsAtom =
      Atom(name: '_KindsOfSportControllerBase._federations', context: context);

  ObservableFuture<List<KindsOfSportDto>> get federations {
    _$_federationsAtom.reportRead();
    return super._federations;
  }

  @override
  ObservableFuture<List<KindsOfSportDto>> get _federations => federations;

  @override
  set _federations(ObservableFuture<List<KindsOfSportDto>> value) {
    _$_federationsAtom.reportWrite(value, super._federations, () {
      super._federations = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_KindsOfSportControllerBase.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
