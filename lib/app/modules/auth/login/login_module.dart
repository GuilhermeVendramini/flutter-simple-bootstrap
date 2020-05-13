import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';
import 'package:simple_bootstrap/app/modules/auth/login/login_controller.dart';
import 'package:simple_bootstrap/app/modules/auth/login/login_page.dart';

class LoginModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(
            create: (_) => LoginController(
                  Provider.of<CoreController>(context),
                )),
      ],
      child: I18n(
        child: LoginPage(),
      ),
    );
  }
}
