import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';

class UsersEvent extends Event {}

class UsersEventFetch implements UsersEvent {}

class UsersEventActivate implements UsersEvent {
  ActivateUserParams params;

  UsersEventActivate(this.params);
}

class UsersEventDeleteUser implements UsersEvent {
  UserEntity entity;

  UsersEventDeleteUser(this.entity);
}
