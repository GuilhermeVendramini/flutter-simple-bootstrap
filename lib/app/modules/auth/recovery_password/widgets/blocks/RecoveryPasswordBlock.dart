import 'package:flutter/material.dart';
import 'package:simple_bootstrap/app/modules/auth/recovery_password/widgets/forms/RecoveryPasswordForm.dart';

class RecoveryPasswordBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: RecoveryPasswordForm(),
    );
  }
}
