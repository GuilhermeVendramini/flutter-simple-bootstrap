import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/modules/auth/recovery_password/recovery_password_controller.dart';
import 'package:simple_bootstrap/app/shared/utils/i18n/i18n_config.dart';
import 'package:simple_bootstrap/app/shared/utils/snackbar/default_snackbar.dart';
import 'package:simple_bootstrap/app/shared/utils/validators/default_validator.dart';
import 'package:simple_bootstrap/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:simple_bootstrap/app/shared/widgets/fields/default_text_form_field.dart';

class RecoveryPasswordForm extends StatefulWidget {
  @override
  _RecoveryPasswordFormState createState() => _RecoveryPasswordFormState();
}

class _RecoveryPasswordFormState extends State<RecoveryPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  RecoveryPasswordController _recoveryPasswordController;

  void _formSubmit() async {
    await _recoveryPasswordController.recoveryPassword();
    DefaultSnackBar.buildSnackBar(
      context: context,
      content: _recoveryPasswordController.messageStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    _recoveryPasswordController =
        Provider.of<RecoveryPasswordController>(context);
    _recoveryPasswordController.formKey = _formKey;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: i18nDefault.email.i18n,
            icon: Icons.email,
            validator: DefaultValidator.isEmail,
            onChanged: _recoveryPasswordController.onChangeEmail,
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(builder: (_) {
            if (_recoveryPasswordController.recoveryPasswordStatus ==
                RecoveryPasswordStatus.LOADING) {
              return CircularProgressIndicator();
            } else {
              return DefaultRaisedButton(
                text: i18nDefault.submit.i18n,
                onPressed: _recoveryPasswordController.emailValidated
                    ? _formSubmit
                    : null,
              );
            }
          }),
        ],
      ),
    );
  }
}
