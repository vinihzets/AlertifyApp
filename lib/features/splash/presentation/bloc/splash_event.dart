import 'package:alertifyapp/core/architecture/event.dart';
import 'package:flutter/material.dart';

class SplashEvent extends Event {}

class SplashEventAuthentication implements SplashEvent {
  BuildContext context;

  SplashEventAuthentication(this.context);
}
