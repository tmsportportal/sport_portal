import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../../widgets/elevated_button_with_state.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = GetIt.instance<LoginController>();

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.login),
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
                    width: 150.0,
                    child: ElevatedButtonWithState(
                      onPressed: () {
                        _controller.onLoginTap(_formKey, () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        });
                      },
                      isLoading:
                          _controller.future?.status == FutureStatus.pending,
                      isError:
                          _controller.future?.status == FutureStatus.rejected,
                      child: Text(context.loc.login),
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
