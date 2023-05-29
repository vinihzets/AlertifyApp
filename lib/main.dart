import 'package:alertifyapp/core/configs/build.dart';
import 'package:alertifyapp/core/inject/injector.dart';
import 'package:alertifyapp/core/services/firebase_messaging_services.dart';
import 'package:alertifyapp/core/services/notification_service.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/core/utils/routes_builder.dart';
import 'package:alertifyapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  Injector.build();

  await FirebaseInitialize.initConfigurations();
  late FirebaseMessagingServices messagingServices;
  late ConstRoutes routes;

  routes = GetIt.I.get();
  messagingServices = GetIt.I.get();

  await messagingServices.initialize();

  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late ConstRoutes routes;
  late ThemeState theme;

  @override
  void initState() {
    theme = GetIt.I.get();
    routes = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: theme.isDarkState,
      builder: (BuildContext context, value, child) {
        return MaterialApp(
          theme: theme.isDarkState.value
              ? theme.themeDarkState
              : theme.themeLightState,
          initialRoute: routes.splash,
          routes: Routes.builder(routes),
        );
      },
    );
  }
}
