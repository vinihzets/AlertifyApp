import 'package:alertifyapp/core/global/entities/user_entity.dart';

import '../failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}

class SignInParams {
  String email;
  String password;

  SignInParams(this.email, this.password);
}

class RegisterParams {
  String email;
  String password;
  String name;

  RegisterParams(this.email, this.password, this.name);
}

class NoParams {}

class CustomNotificationMessageParams {
  String title;
  String body;

  CustomNotificationMessageParams(this.title, this.body);
}

class ActivateUserParams {
  UserEntity entity;
  bool active;

  ActivateUserParams(this.entity, this.active);
}
