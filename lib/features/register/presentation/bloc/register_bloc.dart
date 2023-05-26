import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/core/utils/string_translator.dart';
import 'package:alertifyapp/features/register/domain/usecases/sign_up_usecase_impl.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_event.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends Bloc {
  SignUpUseCaseImpl signUpUseCaseImpl;
  ConstRoutes routes;
  RegisterBloc(this.signUpUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is RegisterEventOnReady) {
      onReady();
    } else if (event is RegisterEventSignUp) {
      _handleSignUp(event.context, event.params);
    } else if (event is RegisterEventNavigatePop) {
      _handleNavigatePop(event.context);
    }
  }

  void onReady() {
    dispatchState(BlocStableState());
  }

  _handleSignUp(BuildContext context, RegisterParams params) async {
    final registerRequest = await signUpUseCaseImpl.call(params);

    registerRequest.fold((l) {
      showSnack(context, StringTranslator.build(l.message), Colors.red);
    }, (r) {
      showSnack(context, 'Registrou com sucesso', Colors.green);
      navigateRemoveUntil(context, routes.login);
    });
  }

  _handleNavigatePop(BuildContext context) {
    Navigator.pop(context);
  }
}
