import 'package:flutter/material.dart';
import 'package:simple_bootstrap/app/modules/auth/register/widgets/forms/register_form.dart';

class RegisterBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          RegisterForm(),
        ],
      ),
    );
  }
}
