import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/login/presentation/bloc/login_bloc.dart';
import 'package:alertifyapp/features/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginViewStableData extends StatefulWidget {
  final LoginBloc bloc;

  const LoginViewStableData({required this.bloc, super.key});

  @override
  State<LoginViewStableData> createState() => _LoginViewStableDataState();
}

class _LoginViewStableDataState extends State<LoginViewStableData> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ConstRoutes routes;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    routes = GetIt.I.get();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notification_important_outlined,
              size: 64,
            ),
            const Text(
              'Alertify',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 260,
              child: TextField(
                controller: emailController,
              ),
            ),
            SizedBox(
              width: 260,
              child: TextField(
                controller: passwordController,
                obscuringCharacter: '*',
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ElevatedButton(
              onPressed: () => widget.bloc.dispatchEvent(LoginEventSignIn(
                  SignInParams(emailController.text, passwordController.text),
                  context)),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              child: const Text('Fazer Login'),
            ),
            TextButton(
                onPressed: () => widget.bloc.dispatchEvent(
                    LoginEventNavigateFeatureThenUntil(
                        context, routes.register)),
                child: const Text(
                  'Registrar-se',
                  style: TextStyle(color: Colors.grey),
                ))
          ]),
    );
  }
}
