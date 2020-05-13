import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/modules/home/home_controller.dart';
import 'package:simple_bootstrap/app/modules/home/home_page.dart';

class HomeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: I18n(
        child: HomePage(),
      ),
    );
  }
}
