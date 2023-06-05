import 'package:alertifyapp/core/architecture/event.dart';
import 'package:flutter/material.dart';

class HomeEvent extends Event {}

class HomeEventSignOut implements HomeEvent {
  BuildContext context;

  HomeEventSignOut(this.context);
}

class HomeEventPermissionsNotification implements HomeEvent {
  BuildContext context;

  HomeEventPermissionsNotification(this.context);
}

class HomeEventSendNotification implements HomeEvent {
  BuildContext context;
  String title;
  String body;

  HomeEventSendNotification(this.context, this.title, this.body);
}

class HomeEventGetCustomNotifications implements HomeEvent {}
