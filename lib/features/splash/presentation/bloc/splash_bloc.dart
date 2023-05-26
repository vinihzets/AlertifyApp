import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/splash/domain/usecases/router_usecase_impl.dart';
import 'package:alertifyapp/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter/material.dart';

class SplashBloc extends Bloc {
  AuthService auth;
  ConstRoutes routes;
  RouterUseCaseImpl routerUseCaseImpl;
  SplashBloc(this.auth, this.routes, this.routerUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is SplashEventAuthentication) {
      _handleAuthentication(event.context);
    }
  }

  _handleAuthentication(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (auth.auth.currentUser != null) {
        _handleRouter(context);
      } else if (auth.auth.currentUser == null) {
        return navigateRemoveUntil(context, routes.login);
      }
    });
  }

  _handleRouter(BuildContext context) async {
    final routeRequest = await routerUseCaseImpl.call(NoParams());

    routeRequest.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      navigateRemoveUntil(context, r);
    });
  }
}
