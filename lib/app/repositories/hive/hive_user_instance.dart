import 'package:simple_bootstrap/app/repositories/hive/hive_user_repository.dart';

class HiveUserInstance {
  HiveUserInstance._();

  static final HiveUserRepository repository = HiveUserRepository();
}
