import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/modules/auth/login/login_controller.dart';
import 'package:simple_bootstrap/app/shared/models/user_model.dart';
import 'package:simple_bootstrap/app/shared/utils/i18n/i18n_config.dart';
import 'package:simple_bootstrap/app/shared/utils/snackbar/default_snackbar.dart';
import 'package:simple_bootstrap/app/shared/utils/validators/default_validator.dart';
import 'package:simple_bootstrap/app/shared/widgets/buttons/default_raised_button.dart';
import 'package:simple_bootstrap/app/shared/widgets/fields/default_password_form_field.dart';
import 'package:simple_bootstrap/app/shared/widgets/fields/default_text_form_field.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController _loginController;

  void _formSubmit() async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      UserModel user = await _loginController.loginWithEmailPassword();
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (_loginController.messageStatus.isNotEmpty) {
          DefaultSnackBar.buildSnackBar(
            context: context,
            content: _loginController.messageStatus,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _loginController = Provider.of<LoginController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: i18nDefault.email.i18n,
            icon: Icons.email,
            validator: DefaultValidator.isEmail,
            onChanged: _loginController.onChangeEmail,
          ),
          DefaultPasswordFormField(
            hintText: i18nDefault.password.i18n,
            icon: Icons.lock,
            validator: DefaultValidator.password,
            onChanged: _loginController.onChangePassword,
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(builder: (_) {
            if (_loginController.signInUserStatus == SignInUserStatus.LOADING) {
              return CircularProgressIndicator();
            } else {
              return DefaultRaisedButton(
                text: i18nDefault.login.i18n,
                onPressed: _loginController.emailPasswordValidated
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
