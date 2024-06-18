// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AthletesController on _AthletesControllerBase, Store {
  late final _$_athletesListAtom =
      Atom(name: '_AthletesControllerBase._athletesList', context: context);

  ObservableFuture<List<FederationAthletesDto>>? get athletesList {
    _$_athletesListAtom.reportRead();
    return super._athletesList;
  }

  @override
  ObservableFuture<List<FederationAthletesDto>>? get _athletesList =>
      athletesList;

  @override
  set _athletesList(ObservableFuture<List<FederationAthletesDto>>? value) {
    _$_athletesListAtom.reportWrite(value, super._athletesList, () {
      super._athletesList = value;
    });
  }

  late final _$_AthletesControllerBaseActionController =
      ActionController(name: '_AthletesControllerBase', context: context);

  @override
  void fetchAthletes() {
    final _$actionInfo = _$_AthletesControllerBaseActionController.startAction(
        name: '_AthletesControllerBase.fetchAthletes');
    try {
      return super.fetchAthletes();
    } finally {
      _$_AthletesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
