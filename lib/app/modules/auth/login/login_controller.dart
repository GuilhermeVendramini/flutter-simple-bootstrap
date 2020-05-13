import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';
import 'package:simple_bootstrap/app/repositories/firebase/firebase_user_instance.dart';
import 'package:simple_bootstrap/app/repositories/firebase/firebase_user_repository.dart';
import 'package:simple_bootstrap/app/repositories/hive/hive_user_instance.dart';
import 'package:simple_bootstrap/app/repositories/hive/hive_user_repository.dart';
import 'package:simple_bootstrap/app/shared/models/user_model.dart';
import 'package:simple_bootstrap/app/shared/utils/validators/default_validator.dart';

part 'login_controller.g.dart';

enum SignInUserStatus { IDLE, LOADING, DONE, ERROR }

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  CoreController _coreController;

  _LoginBase(this._coreController);

  FirebaseUserRepository _userRepository = FirebaseUserInstance.repository;
  HiveUserRepository _hiveUserRepository = HiveUserInstance.repository;
  UserModel currentUser;

  @observable
  SignInUserStatus signInUserStatus = SignInUserStatus.IDLE;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String messageStatus = '';

  @action
  void onChangeEmail(String value) {
    email = value.trim();
  }

  @action
  void onChangePassword(String value) {
    password = value.trim();
  }

  @computed
  bool get emailPasswordValidated {
    if (DefaultValidator.isEmail(email) == null &&
        DefaultValidator.password(password) == null) return true;
    return false;
  }

  Future<UserModel> loginWithEmailPassword() async {
    try {
      signInUserStatus = SignInUserStatus.LOADING;
      currentUser = await _userRepository.signInWithEmailPassword(
          email: email, password: password);

      if (currentUser != null) {
        _hiveUserRepository.saveCurrentUser(user: currentUser);
        _coreController.currentUser = currentUser;
        return currentUser;
      }

      signInUserStatus = SignInUserStatus.DONE;
    } on PlatformException catch (e) {
      messageStatus = e.message;
      signInUserStatus = SignInUserStatus.ERROR;
    }

    return null;
  }
}
