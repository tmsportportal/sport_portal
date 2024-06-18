// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_care_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HealthCareController on _HealthCareControllerBase, Store {
  late final _$healthCareListAtom =
      Atom(name: '_HealthCareControllerBase.healthCareList', context: context);

  @override
  ObservableFuture<List<HealthCareDto>> get healthCareList {
    _$healthCareListAtom.reportRead();
    return super.healthCareList;
  }

  @override
  set healthCareList(ObservableFuture<List<HealthCareDto>> value) {
    _$healthCareListAtom.reportWrite(value, super.healthCareList, () {
      super.healthCareList = value;
    });
  }

  late final _$_HealthCareControllerBaseActionController =
      ActionController(name: '_HealthCareControllerBase', context: context);

  @override
  void fetchHealthCare() {
    final _$actionInfo = _$_HealthCareControllerBaseActionController
        .startAction(name: '_HealthCareControllerBase.fetchHealthCare');
    try {
      return super.fetchHealthCare();
    } finally {
      _$_HealthCareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
healthCareList: ${healthCareList}
    ''';
  }
}
