import 'package:flutter/material.dart';

import '../../../../core/architecture/event.dart';

class NotActiveEvent extends Event {}

class NotActiveEventSignOut extends Event {
  BuildContext context;

  NotActiveEventSignOut(this.context);
}
