// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaches_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoachesController on _CoachesControllerBase, Store {
  late final _$_coachesListAtom =
      Atom(name: '_CoachesControllerBase._coachesList', context: context);

  ObservableFuture<List<FederationCoachesDto>>? get coachesList {
    _$_coachesListAtom.reportRead();
    return super._coachesList;
  }

  @override
  ObservableFuture<List<FederationCoachesDto>>? get _coachesList => coachesList;

  @override
  set _coachesList(ObservableFuture<List<FederationCoachesDto>>? value) {
    _$_coachesListAtom.reportWrite(value, super._coachesList, () {
      super._coachesList = value;
    });
  }

  late final _$_CoachesControllerBaseActionController =
      ActionController(name: '_CoachesControllerBase', context: context);

  @override
  void fetchCoaches() {
    final _$actionInfo = _$_CoachesControllerBaseActionController.startAction(
        name: '_CoachesControllerBase.fetchCoaches');
    try {
      return super.fetchCoaches();
    } finally {
      _$_CoachesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
