import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ProfileEvent extends Event {}

class ProfileEventGetUser implements ProfileEvent {}

class ProfileEventDeleteUser implements ProfileEvent {
  BuildContext context;
  UserEntity entity;

  ProfileEventDeleteUser(this.context, this.entity);
}
