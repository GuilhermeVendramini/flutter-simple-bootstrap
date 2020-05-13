import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';
import 'package:simple_bootstrap/app/core/core_widget.dart';

class CoreModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CoreController>(create: (_) => CoreController()),
      ],
      child: I18n(
        child: CoreWidget(),
      ),
    );
  }
}
