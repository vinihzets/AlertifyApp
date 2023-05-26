import 'package:alertifyapp/core/architecture/usecase.dart';

abstract class LoginDataSources {
  Future<String> signIn(SignInParams params);
}
