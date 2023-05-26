import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';

abstract class UserDataSources {
  Future<List<UserEntity>> fetchUsers();
  Future<List<UserEntity>> activate(ActivateUserParams params);
}
