import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';
import 'package:simple_bootstrap/app/shared/utils/i18n/i18n_config.dart';

class CoreSplashPage extends StatefulWidget {
  final CoreController _coreController;

  CoreSplashPage(this._coreController);

  @override
  _CoreSplashPageState createState() => _CoreSplashPageState();
}

class _CoreSplashPageState extends State<CoreSplashPage> {
  CoreController get _coreController {
    return widget._coreController;
  }

  @override
  void initState() {
    _coreController.loadCurrentUser().then((_) {
      if (_coreController.currentUser != null) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18nDefault.appName.i18n),
        ),
        body: Center(
          child: Observer(
            builder: (_) {
              switch (_coreController.userLoadStatus) {
                case UserLoadStatus.ERROR:
                  return Text(_coreController.messageStatus);
                  break;
                case UserLoadStatus.LOADING:
                case UserLoadStatus.DONE:
                case UserLoadStatus.IDLE:
                default:
                  return Text(i18nDefault.appName.i18n);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
