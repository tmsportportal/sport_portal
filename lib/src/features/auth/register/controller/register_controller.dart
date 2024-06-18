import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/auth/register/data/dto/register_dto.dart';
import 'package:sport_portal/src/features/auth/register/data/repository/register_repository.dart';

import '../../../../utils/validator.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameFocus = FocusNode();
  final surnameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @readonly
  ObservableFuture? _future;

  final _api = RegisterRepository();

  @observable
  bool obscured = true;

  @action
  void changeVisibility() {
    obscured = !obscured;
  }

  // @action
  // void getUsers() {
  //   _future = ObservableFuture(_dio.get('/users')).then(
  //     (value) => print(value),
  //   );
  // }

  String? validateName(BuildContext context) {
    final text = nameController.text;

    if (text.isEmpty) {
      return context.loc.fillField;
    } else if (!Validator.matchAsciiTextWithSymbols(text)) {
      return context.loc.onlyText;
    }
    return null;
  }

  String? validateSurname(BuildContext context) {
    final text = surnameController.text;
    if (text.isEmpty) {
      return context.loc.fillField;
    } else if (!Validator.matchAsciiTextWithSymbols(text)) {
      return context.loc.onlyText;
    }
    return null;
  }

  String? validateEmail(BuildContext context) {
    final text = emailController.text;
    if (text.isEmpty) {
      return context.loc.fillField;
    } else if (!Validator.matchEmail(text)) {
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

  @action
  void onRegisterTap(GlobalKey<FormState> key, VoidCallback completeCallback) {
    if (key.currentState?.validate() ?? false) {
      final dto = RegisterDto(nameController.text, surnameController.text,
          emailController.text, passwordController.text);
      try {
        _future = ObservableFuture(_api.register(dto))
            .then((value) => completeCallback());
      } on Exception catch (e) {
        _future = ObservableFuture.error(e);
      }
    }
  }

  /// dispose controller and focus nodes.
  /// This method will be called in StatefulWidget dispose method
  void disposeControllers() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    nameFocus.dispose();
    surnameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  void clearControllers() {
    nameController.clear();
    surnameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
