import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/core/utils/string_translator.dart';
import 'package:alertifyapp/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:alertifyapp/features/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc {
  SignInUseCaseImpl signInUseCaseImpl;
  ConstRoutes routes;

  LoginBloc(this.signInUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is LoginEventOnReady) {
      onReady();
    } else if (event is LoginEventSignIn) {
      _handleSignIn(event.context, event.params);
    } else if (event is LoginEventNavigateFeatureThenUntil) {
      _handleNavigateFeatureThenUntil(event.context, event.routeName);
    }
  }

  void onReady() {
    dispatchState(BlocStableState());
  }

  _handleSignIn(BuildContext context, SignInParams params) async {
    final signInRequest = await signInUseCaseImpl.call(params);

    signInRequest.fold(
        (l) =>
            {showSnack(context, StringTranslator.build(l.message), Colors.red)},
        (r) => {navigateRemoveUntil(context, r)});
  }

  _handleNavigateFeatureThenUntil(BuildContext context, String routeName) {
    navigateThenUntil(context, routeName);
  }
}
