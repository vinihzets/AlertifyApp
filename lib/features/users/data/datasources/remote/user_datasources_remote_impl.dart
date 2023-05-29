import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/core/global/mappers/user_mapper.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/core/services/functions_services.dart';
import 'package:alertifyapp/features/users/data/datasources/user_datasources.dart';

class UserDataSourcesRemoteImpl implements UserDataSources {
  DatabaseService databaseService;
  AuthService authService;
  FunctionsServices functions;
  UserDataSourcesRemoteImpl(
      this.databaseService, this.authService, this.functions);

  @override
  Future<List<UserEntity>> fetchUsers() async {
    final tableUsers = await databaseService.tableUsers.get();

    final listUsers = tableUsers.docs.map(UserMapper.fromJson).toList();

    return listUsers;
  }

  @override
  Future<List<UserEntity>> activate(ActivateUserParams params) async {
    databaseService.tableUsers.doc(params.entity.docId).update({
      'active': params.active,
    });

    final tableUsers = await databaseService.tableUsers.get();
    final listUsers = tableUsers.docs.map(UserMapper.fromJson).toList();

    return listUsers;
  }

  @override
  Future<void> deleteUser(UserEntity entity) async {
    if (authService.auth.currentUser != null) {
      try {
        final callable = functions.service.httpsCallable('deleteUser');
        await callable.call({'userId': entity.userId});
        await databaseService.tableUsers.doc(entity.docId).delete();
      } catch (e) {
        return;
      }
    } else {
      return;
    }
  }
}
