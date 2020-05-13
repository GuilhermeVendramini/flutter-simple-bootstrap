import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/modules/auth/recovery_password/recovery_password_controller.dart';
import 'package:simple_bootstrap/app/modules/auth/recovery_password/recovery_password_page.dart';

class RecoveryPasswordModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RecoveryPasswordController>(
            create: (_) => RecoveryPasswordController()),
      ],
      child: I18n(
        child: RecoveryPasswordPage(),
      ),
    );
  }
}
