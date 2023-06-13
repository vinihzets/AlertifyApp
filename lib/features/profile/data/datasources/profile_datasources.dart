import 'package:alertifyapp/core/global/entities/user_entity.dart';

abstract class ProfileDataSources {
  Future<UserEntity> fetchUser();
  Future<dynamic> deleteUser(UserEntity entity);
}
