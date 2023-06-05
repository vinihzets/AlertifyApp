import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/core/services/firebase_messaging_services.dart';
import 'package:alertifyapp/core/services/functions_services.dart';
import 'package:alertifyapp/core/services/notification_service.dart';
import 'package:alertifyapp/features/home/data/datasources/home_datasources.dart';
import 'package:alertifyapp/features/home/data/datasources/remote/home_datasources_remote_impl.dart';
import 'package:alertifyapp/features/home/data/repositories/home_repository_impl.dart';
import 'package:alertifyapp/features/home/domain/repositories/home_repository.dart';
import 'package:alertifyapp/features/users/domain/usecases/delete_user_usecase_impl.dart';
import 'package:alertifyapp/features/home/domain/usecases/send_custom_notification_message_impl.dart';
import 'package:alertifyapp/features/home/domain/usecases/sign_out_usecase_impl.dart';
import 'package:alertifyapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:alertifyapp/features/login/data/datasources/login_datasources.dart';
import 'package:alertifyapp/features/login/data/datasources/remote/login_datasources_remote_impl.dart';
import 'package:alertifyapp/features/login/data/repositories/login_repository_impl.dart';
import 'package:alertifyapp/features/login/domain/repositories/login_repository.dart';
import 'package:alertifyapp/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:alertifyapp/features/login/presentation/bloc/login_bloc.dart';
import 'package:alertifyapp/features/not_active/data/datasources/not_active_datasources.dart';
import 'package:alertifyapp/features/not_active/data/datasources/remote/not_active_datasources_remote_impl.dart';
import 'package:alertifyapp/features/not_active/data/repositories/not_active_repository_impl.dart';
import 'package:alertifyapp/features/not_active/domain/repositories/not_active_repository.dart';
import 'package:alertifyapp/features/not_active/domain/usecases/leave_application_usecase_impl.dart';
import 'package:alertifyapp/features/not_active/presentation/bloc/not_active_bloc.dart';
import 'package:alertifyapp/features/register/data/datasources/register_datasources.dart';
import 'package:alertifyapp/features/register/data/datasources/remote/register_datasources_remote_impl.dart';
import 'package:alertifyapp/features/register/data/repositories/register_repository_impl.dart';
import 'package:alertifyapp/features/register/domain/repositories/register_repository.dart';
import 'package:alertifyapp/features/register/domain/usecases/sign_up_usecase_impl.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_bloc.dart';
import 'package:alertifyapp/features/splash/data/datasources/remote/splash_datasources_remote_impl.dart';
import 'package:alertifyapp/features/splash/data/datasources/splash_datasources.dart';
import 'package:alertifyapp/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:alertifyapp/features/splash/domain/repositories/splash_repository.dart';
import 'package:alertifyapp/features/splash/domain/usecases/router_usecase_impl.dart';
import 'package:alertifyapp/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:alertifyapp/features/users/data/datasources/remote/user_datasources_remote_impl.dart';
import 'package:alertifyapp/features/users/data/datasources/user_datasources.dart';
import 'package:alertifyapp/features/users/data/repositories/user_repository_impl.dart';
import 'package:alertifyapp/features/users/domain/repositories/user_repository.dart';
import 'package:alertifyapp/features/users/domain/usecases/activate_user_usecase_impl.dart';
import 'package:alertifyapp/features/users/domain/usecases/fetch_users_usecase_impl.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_bloc.dart';
import 'package:alertifyapp/features/walkthrough/presentation/bloc/walkthrough_bloc.dart';
import 'package:alertifyapp/theme.dart';
import 'package:get_it/get_it.dart';

import '../utils/const_routes.dart';

class Injector {
  static build() {
    GetIt getIt = GetIt.instance;

    //CORE

    getIt.registerLazySingleton(() => ThemeState());
    getIt.registerLazySingleton(() => FunctionsServices());
    getIt.registerLazySingleton(() => DatabaseService());
    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => ConstRoutes());
    getIt.registerLazySingleton(() => NotificationService());
    getIt.registerLazySingleton(() => FirebaseMessagingServices(getIt()));

    //DATASOURCES

    getIt.registerLazySingleton<NotActiveDataSources>(
        () => NotActiveDataSourcesRemoteImpl(getIt()));
    getIt.registerLazySingleton<UserDataSources>(
        () => UserDataSourcesRemoteImpl(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<HomeDataSources>(
        () => HomeDataSourcesRemoteImpl(getIt(), getIt()));
    getIt.registerLazySingleton<RegisterDataSources>(
        () => RegisterDataSourcesRemoteImpl(getIt(), getIt()));
    getIt.registerLazySingleton<LoginDataSources>(
        () => LoginDataSourcesRemoteImpl(getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<SplashDataSources>(
        () => SplashDataSourcesRemoteImpl(getIt(), getIt(), getIt()));

    //REPOSITORIES

    getIt.registerLazySingleton<NotActiveRepository>(
        () => NotActiveRepositoryImpl(getIt()));
    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(getIt()));
    getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt()));
    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));
    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));
    getIt.registerLazySingleton<SplashRepository>(
        () => SplashRepositoryImpl(getIt()));

    //USECASES

    getIt.registerLazySingleton(() => DeleteUserUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => LeaveApplicationUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => ActivateUserUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => FetchUsersUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SendCustomNotificationMessage(getIt()));
    getIt.registerLazySingleton(() => SignOutUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignUpUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => SignInUseCaseImpl(getIt()));
    getIt.registerLazySingleton(() => RouterUseCaseImpl(getIt()));

    //BLOC

    getIt.registerFactory(() => WalkthroughBloc(
          getIt(),
        ));
    getIt.registerFactory(() => NotActiveBloc(getIt(), getIt()));
    getIt.registerFactory(() => UsersBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => HomeBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => RegisterBloc(getIt(), getIt()));
    getIt.registerFactory(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory(() => SplashBloc(getIt(), getIt(), getIt()));
  }
}
