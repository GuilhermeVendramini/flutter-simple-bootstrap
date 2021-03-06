import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_bootstrap/app/repositories/hive/hive_models_adapters/hive_user_model.dart';
import 'package:simple_bootstrap/app/shared/models/user_model.dart';

class HiveUserRepository {
  Box<HiveUserModel> _currentUserBox;

  Future<Null> loadCurrentUserBox() async {
    if (_currentUserBox == null) {
      try {
        var dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
        Hive.registerAdapter(HiveUserModelAdapter());
        _currentUserBox = await Hive.openBox<HiveUserModel>('currentUserBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveCurrentUser({@required UserModel user}) async {
    await loadCurrentUserBox();
    _currentUserBox.put(
      'currentUser',
      HiveUserModel(
        id: user.id,
        name: user.name,
        email: user.email,
      ),
    );
    return;
  }

  Future<Null> deleteCurrentUser() async {
    await loadCurrentUserBox();
    _currentUserBox.delete('currentUser');
    return;
  }

  Future<UserModel> getCurrentUser() async {
    await loadCurrentUserBox();
    if (_currentUserBox.isNotEmpty) {
      UserModel currentUser = _currentUserBox.get('currentUser');
      return currentUser;
    }
    return null;
  }
}
