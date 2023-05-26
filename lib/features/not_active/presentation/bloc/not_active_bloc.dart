import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/not_active/domain/usecases/leave_application_usecase_impl.dart';
import 'package:alertifyapp/features/not_active/presentation/bloc/not_active_event.dart';
import 'package:flutter/material.dart';

class NotActiveBloc extends Bloc {
  LeaveApplicationUseCaseImpl signOutUseCaseImpl;
  ConstRoutes routes;
  NotActiveBloc(this.signOutUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is NotActiveEventSignOut) {
      _handleSignOut(event.context);
    }
  }

  _handleSignOut(BuildContext context) async {
    final signOutRequest = await signOutUseCaseImpl.call(NoParams());

    signOutRequest.fold((l) {}, (r) {
      navigateRemoveUntil(context, routes.login);
    });
  }
}
