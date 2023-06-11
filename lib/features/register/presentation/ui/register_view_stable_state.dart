import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_bloc.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_event.dart';
import 'package:flutter/material.dart';

class RegisterViewStableData extends StatefulWidget {
  final RegisterBloc bloc;

  const RegisterViewStableData({required this.bloc, super.key});

  @override
  State<RegisterViewStableData> createState() => _RegisterViewStableDataState();
}

class _RegisterViewStableDataState extends State<RegisterViewStableData> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

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
              'Cadastro',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 260,
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: emailController,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 260,
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: passwordController,
                obscuringCharacter: '*',
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ElevatedButton(
              onPressed: () => widget.bloc.dispatchEvent(RegisterEventSignUp(
                  RegisterParams(emailController.text, passwordController.text),
                  context)),
              child: const Text('Cadastrar-se'),
            ),
            TextButton(
                onPressed: () => widget.bloc
                    .dispatchEvent(RegisterEventNavigatePop(context)),
                child: const Text(
                  'Login',
                ))
          ]),
    );
  }
}
