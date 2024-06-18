// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountController on _AccountControllerBase, Store {
  late final _$_accountAtom =
      Atom(name: '_AccountControllerBase._account', context: context);

  Account get account {
    _$_accountAtom.reportRead();
    return super._account;
  }

  @override
  Account get _account => account;

  @override
  set _account(Account value) {
    _$_accountAtom.reportWrite(value, super._account, () {
      super._account = value;
    });
  }

  late final _$_observableAccountAtom =
      Atom(name: '_AccountControllerBase._observableAccount', context: context);

  ObservableFuture<Account> get observableAccount {
    _$_observableAccountAtom.reportRead();
    return super._observableAccount;
  }

  @override
  ObservableFuture<Account> get _observableAccount => observableAccount;

  @override
  set _observableAccount(ObservableFuture<Account> value) {
    _$_observableAccountAtom.reportWrite(value, super._observableAccount, () {
      super._observableAccount = value;
    });
  }

  late final _$getAccountAsyncAction =
      AsyncAction('_AccountControllerBase.getAccount', context: context);

  @override
  Future<void> getAccount() {
    return _$getAccountAsyncAction.run(() => super.getAccount());
  }

  late final _$_AccountControllerBaseActionController =
      ActionController(name: '_AccountControllerBase', context: context);

  @override
  void onAccountUpdate(Account account) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.onAccountUpdate');
    try {
      return super.onAccountUpdate(account);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
