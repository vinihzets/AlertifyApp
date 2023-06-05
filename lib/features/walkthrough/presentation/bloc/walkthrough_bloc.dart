import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/walkthrough/presentation/bloc/walkthrough_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalkthroughBloc extends Bloc {
  ConstRoutes routes;

  WalkthroughBloc(
    this.routes,
  );

  @override
  mapListenEvent(Event event) {
    if (event is WalkthroughEventNavigate) {
      _handleNavigate(event.context);
    } else if (event is WalkthroughEventSetPreferences) {
      _handleSetPreferences();
    }
  }

  _handleNavigate(BuildContext context) {
    navigateRemoveUntil(context, routes.splash);
  }

  _handleSetPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setBool('isFirstSeen', false);
  }
}
