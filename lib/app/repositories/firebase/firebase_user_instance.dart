import 'package:simple_bootstrap/app/repositories/firebase/firebase_user_repository.dart';

class FirebaseUserInstance {
  FirebaseUserInstance._();

  static final FirebaseUserRepository repository = FirebaseUserRepository();
}
