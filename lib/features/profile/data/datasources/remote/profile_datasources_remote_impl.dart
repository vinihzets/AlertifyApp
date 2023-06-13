import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/core/global/mappers/user_mapper.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/features/profile/data/datasources/profile_datasources.dart';

class ProfileDataSourcesRemoteImpl implements ProfileDataSources {
  DatabaseService databaseService;
  AuthService authService;
  ProfileDataSourcesRemoteImpl(this.databaseService, this.authService);

  @override
  Future<UserEntity> fetchUser() async {
    final docUsers = await databaseService.tableUsers.get();

    final listUsers = docUsers.docs
        .map((e) => UserMapper.fromJson(e.data()))
        .where((element) => element.userId == authService.auth.currentUser!.uid)
        .toList();

    final user = listUsers.first;

    return user;
  }

  @override
  Future deleteUser(UserEntity entity) async {
    return await databaseService.tableUsers.doc(entity.docId).delete();
  }
}
