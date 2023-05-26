import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:flutter/material.dart';

class RegisterEvent extends Event {}

class RegisterEventSignUp implements RegisterEvent {
  RegisterParams params;
  BuildContext context;

  RegisterEventSignUp(this.params, this.context);
}

class RegisterEventOnReady implements RegisterEvent {}

class RegisterEventNavigatePop implements RegisterEvent {
  BuildContext context;

  RegisterEventNavigatePop(this.context);
}
