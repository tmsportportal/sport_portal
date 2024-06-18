import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/auth/login/presentation/login_screen.dart';

import '../../../../widgets/elevated_button_with_state.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = GetIt.instance<RegisterController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.register),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller.nameController,
                    validator: (_) => _controller.validateName(context),
                    focusNode: _controller.nameFocus,
                    onTapOutside: (_) {
                      _controller.nameFocus.unfocus();
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.name,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller.surnameController,
                    validator: (_) => _controller.validateSurname(context),
                    onTapOutside: (_) {
                      _controller.surnameFocus.unfocus();
                    },
                    focusNode: _controller.surnameFocus,
                    decoration: InputDecoration(
                      labelText: context.loc.surname,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller.emailController,
                    validator: (_) => _controller.validateEmail(context),
                    focusNode: _controller.emailFocus,
                    onTapOutside: (_) {
                      _controller.emailFocus.unfocus();
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.email,
                      prefixIcon: const Icon(Icons.mail_rounded),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (context) {
                    return TextFormField(
                      controller: _controller.passwordController,
                      validator: (_) => _controller.validatePassword(context),
                      focusNode: _controller.passwordFocus,
                      onTapOutside: (_) {
                        _controller.passwordFocus.unfocus();
                      },
                      obscureText: _controller.obscured,
                      decoration: InputDecoration(
                        labelText: context.loc.password,
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.changeVisibility();
                          },
                          icon: const Icon(Icons.visibility),
                        ),
                      ),
                    );
                  }),
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 50.0,
                    width: 250.0,
                    child: ElevatedButtonWithState(
                      onPressed: () {
                        _controller.onRegisterTap(_formKey, () {
                          _controller.clearControllers();
                          Navigator.pushNamed(context, LoginScreen.route);
                        });
                      },
                      isLoading:
                          _controller.future?.status == FutureStatus.pending,
                      isError:
                          _controller.future?.status == FutureStatus.rejected,
                      child: Text(context.loc.register.toUpperCase()),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
