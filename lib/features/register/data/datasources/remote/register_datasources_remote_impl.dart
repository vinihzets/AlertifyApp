import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/features/register/data/datasources/register_datasources.dart';
import 'package:alertifyapp/features/register/data/mappers/register_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/architecture/usecase.dart';

class RegisterDataSourcesRemoteImpl implements RegisterDataSources {
  AuthService auth;
  DatabaseService databaseService;
  RegisterDataSourcesRemoteImpl(this.auth, this.databaseService);

  @override
  Future<UserCredential> signUp(RegisterParams params) async {
    final signUpRequest = await auth.auth.createUserWithEmailAndPassword(
        email: params.email, password: params.password);

    final mapper = RegisterMapper(params.email, false);

    await databaseService.tableUsers
        .add(mapper.toMap())
        .then((value) => databaseService.tableUsers.doc(value.id).update({
              'docId': value.id,
              'userId': auth.auth.currentUser!.uid,
              'fcmToken': '',
              'isAdmin': false,
            }));

    return signUpRequest;
  }
}
