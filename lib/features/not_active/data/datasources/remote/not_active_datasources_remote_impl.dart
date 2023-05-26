import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/features/not_active/data/datasources/not_active_datasources.dart';

class NotActiveDataSourcesRemoteImpl implements NotActiveDataSources {
  AuthService auth;

  NotActiveDataSourcesRemoteImpl(this.auth);

  @override
  Future<void> signOut() async {
    return await auth.auth.signOut();
  }
}
