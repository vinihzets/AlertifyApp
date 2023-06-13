import 'dart:developer';

import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/home/domain/usecases/get_custom_notifications_usecase_imp.dart';
import 'package:alertifyapp/features/home/domain/usecases/send_custom_notification_message_impl.dart';
import 'package:alertifyapp/features/home/domain/usecases/sign_out_usecase_impl.dart';
import 'package:alertifyapp/features/home/presentation/bloc/home_event.dart';
import 'package:alertifyapp/features/home/presentation/widgets/permissions_notifications.dart';
import 'package:flutter/material.dart';

import '../../../../core/architecture/bloc_state.dart';

class HomeBloc extends Bloc {
  SignOutUseCaseImpl signOutUseCaseImpl;
  ConstRoutes routes;
  SendCustomNotificationMessage sendCustomNotificationMessage;
  GetCustomNotificationsUseCaseImpl getCustomNotificationsUseCaseImpl;
  HomeBloc(
      this.signOutUseCaseImpl,
      this.routes,
      this.sendCustomNotificationMessage,
      this.getCustomNotificationsUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventSignOut) {
      _handleSignOut(event.context);
    } else if (event is HomeEventPermissionsNotification) {
      _handlePermissionsNotification(event.context);
    } else if (event is HomeEventSendNotification) {
      _handleSendCustomNotification(event.context, event.title, event.body);
    } else if (event is HomeEventGetCustomNotifications) {
      _handleGetCustomNotifications();
    }
  }

  _handleSignOut(BuildContext context) async {
    final signOutRequest = await signOutUseCaseImpl.call(NoParams());

    signOutRequest.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      navigateRemoveUntil(context, routes.login);
    });
  }

  _handlePermissionsNotification(BuildContext context) {
    return PermissionsNotification.build(context);
  }

  _handleSendCustomNotification(
      BuildContext context, String title, String body) async {
    dispatchState(BlocLoadingState());
    sendCustomNotificationMessage
        .call(CustomNotificationMessageParams(title, body))
        .then((value) {
      value.fold((l) {
        showSnack(context, l.message, Colors.red);
      }, (r) {
        dispatchState(BlocStableState(data: r));
      });
    });
    navigatePop(context);
  }

  _handleGetCustomNotifications() async {
    final notifications =
        await getCustomNotificationsUseCaseImpl.call(NoParams());

    notifications.fold((l) => dispatchState(BlocErrorState(error: l.message)),
        (r) {
      if (r.isEmpty) {
        dispatchState(BlocEmptyState());
      } else {
        dispatchState(BlocStableState(data: r));
      }
    });
  }
}
