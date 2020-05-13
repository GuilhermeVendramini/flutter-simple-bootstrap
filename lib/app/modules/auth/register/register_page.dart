import 'package:flutter/material.dart';
import 'package:simple_bootstrap/app/modules/auth/register/widgets/blocks/register_block.dart';
import 'package:simple_bootstrap/app/shared/utils/i18n/i18n_config.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.register.i18n),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: RegisterBlock(),
        ),
      ),
    );
  }
}
