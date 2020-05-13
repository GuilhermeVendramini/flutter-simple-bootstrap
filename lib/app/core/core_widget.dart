import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';
import 'package:simple_bootstrap/app/core/themes/core_theme.dart';
import 'package:simple_bootstrap/app/core/widgets/pages/not_found/core_not_found_page.dart';
import 'package:simple_bootstrap/app/core/widgets/pages/splash/core_splash_page.dart';
import 'package:simple_bootstrap/app/modules/auth/login/login_module.dart';
import 'package:simple_bootstrap/app/modules/auth/recovery_password/recovery_password_module.dart';
import 'package:simple_bootstrap/app/modules/auth/register/register_module.dart';
import 'package:simple_bootstrap/app/modules/home/home_module.dart';

class CoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoreController _coreController = Provider.of<CoreController>(context);

    return MaterialApp(
      title: 'Flutter Bootstrap',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', "US"),
        const Locale('pt', "BR"),
      ],
      theme: CoreTheme.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => CoreSplashPage(_coreController),
        '/home': (context) => HomeModule(),
        '/login': (context) => LoginModule(),
        '/register': (context) => RegisterModule(),
        '/recovery': (context) => RecoveryPasswordModule(),
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (context) => CoreNotFoundPage(),
        );
      },
    );
  }
}
