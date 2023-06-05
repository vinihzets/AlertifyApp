import 'package:alertifyapp/core/architecture/event.dart';
import 'package:flutter/material.dart';

class WalkthroughEvent extends Event {}

class WalkthroughEventNavigate implements WalkthroughEvent {
  BuildContext context;

  WalkthroughEventNavigate(this.context);
}

class WalkthroughEventSetPreferences implements WalkthroughEvent {}
