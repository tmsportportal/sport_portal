// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  late final _$_futureAtom =
      Atom(name: 'RegisterControllerBase._future', context: context);

  ObservableFuture<dynamic>? get future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  ObservableFuture<dynamic>? get _future => future;

  @override
  set _future(ObservableFuture<dynamic>? value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  late final _$obscuredAtom =
      Atom(name: 'RegisterControllerBase.obscured', context: context);

  @override
  bool get obscured {
    _$obscuredAtom.reportRead();
    return super.obscured;
  }

  @override
  set obscured(bool value) {
    _$obscuredAtom.reportWrite(value, super.obscured, () {
      super.obscured = value;
    });
  }

  late final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase', context: context);

  @override
  void changeVisibility() {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRegisterTap(GlobalKey<FormState> key, VoidCallback completeCallback) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.onRegisterTap');
    try {
      return super.onRegisterTap(key, completeCallback);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscured: ${obscured}
    ''';
  }
}
