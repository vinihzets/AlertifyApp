import 'package:alertifyapp/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(SplashEventAuthentication(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('images/notification.json'),
      ),
    );
  }
}
