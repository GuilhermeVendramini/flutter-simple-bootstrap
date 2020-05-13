import 'package:flutter/material.dart';
import 'package:simple_bootstrap/app/shared/utils/i18n/i18n_config.dart';
import 'package:simple_bootstrap/app/shared/widgets/drawer/default_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.home.i18n),
      ),
      drawer: DefaultDrawer(),
      body: Center(
        child: Text(i18nDefault.welcomeMessage.i18n),
      ),
    );
  }
}
