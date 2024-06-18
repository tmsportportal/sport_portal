import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/auth/account/controller/account_status_controller.dart';

import '../../../../core/local/key_value_storage_service.dart';
import '../../../../core/network/custom_exception.dart';
import '../models/account.dart';

part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  @readonly
  Account _account = const Account();

  final _keyValueStorageService = KeyValueStorageService();
  final _accountLoginStatusController =
      GetIt.instance<AccountStatusController>();

  @readonly
  ObservableFuture<Account> _observableAccount =
      ObservableFuture.value(const Account());

  @action
  void onAccountUpdate(Account account) {
    _observableAccount = ObservableFuture.value(account);
    _account = account;
    _keyValueStorageService.setAuthUser(account);
    _keyValueStorageService.setAuthPassword(account.password ?? '');
    _accountLoginStatusController.getAccountStatus(_observableAccount);
  }

  @action
  Future<void> getAccount() async {
    reaction((p0) => _observableAccount.value, (p0) {
      _accountLoginStatusController.getAccountStatus(_observableAccount);
    });
    if ((await _keyValueStorageService.getAuthToken()).isNotEmpty) {
      try {
        _observableAccount =
            ObservableFuture.value(_keyValueStorageService.getAuthUser());
        // _account = _observableAccount.value;
        _accountLoginStatusController.getAccountStatus(_observableAccount);
      } on Exception catch (e) {
        _observableAccount = ObservableFuture.error(Exception(e));
        _accountLoginStatusController.getAccountStatus(_observableAccount);
      }
    } else {
      _accountLoginStatusController.getAccountStatus(
          ObservableFuture.error(ExceptionType.UnauthorizedException));
    }
  }

  @action
  void logout() {
    _keyValueStorageService.resetKeys();
    _accountLoginStatusController.getAccountStatus(
      ObservableFuture.error(ExceptionType.UnauthorizedException),
    );
  }
}
