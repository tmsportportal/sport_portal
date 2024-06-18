import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/auth/account/controller/account_controller.dart';

import '../../../../core/local/key_value_storage_service.dart';
import '../../../../utils/validator.dart';
import '../data/dto/login_dto.dart';
import '../data/repository/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final _keyValueStorageService = KeyValueStorageService();

  final _accountController = GetIt.instance<AccountController>();

  @readonly
  ObservableFuture? _future;

  @observable
  bool obscured = true;

  @action
  void changeVisibility() {
    obscured = !obscured;
  }

  final _api = LoginRepository();

  String? validateEmail(BuildContext context) {
    final text = emailController.text;

    if (text.isEmpty) {
      return context.loc.fillField;
    }
    if (!Validator.matchEmail(text)) {
      return context.loc.inputCorrectInfo;
    }
    return null;
  }

  String? validatePassword(BuildContext context) {
    final text = passwordController.text;

    if (text.isEmpty) {
      return context.loc.fillField;
    }
    return null;
  }

  void _updateToken(String newToken) {
    _keyValueStorageService.setAuthToken(newToken);
  }

  @action
  void onLoginTap(GlobalKey<FormState> key, VoidCallback completeCallback) {
    if (key.currentState?.validate() ?? false) {
      final dto = LoginDto(emailController.text, passwordController.text);
      try {
        _future = ObservableFuture(_api.login(dto, _updateToken)).then((value) {
          _accountController.onAccountUpdate(value);
          completeCallback();
        });
      } on Exception catch (e) {
        _future = ObservableFuture.error(e);
      }
    }
  }

  /// dispose controller and focus nodes.
  /// This method will be called in StatefulWidget dispose method
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
