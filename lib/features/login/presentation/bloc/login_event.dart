import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:flutter/material.dart';

class LoginEvent extends Event {}

class LoginEventOnReady implements LoginEvent {}

class LoginEventSignIn implements LoginEvent {
  SignInParams params;
  BuildContext context;

  LoginEventSignIn(this.params, this.context);
}

class LoginEventNavigateFeatureThenUntil implements LoginEvent {
  BuildContext context;
  String routeName;

  LoginEventNavigateFeatureThenUntil(this.context, this.routeName);
}
