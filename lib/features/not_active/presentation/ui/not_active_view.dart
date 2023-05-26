import 'package:alertifyapp/features/not_active/presentation/bloc/not_active_bloc.dart';
import 'package:alertifyapp/features/not_active/presentation/bloc/not_active_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NotActiveView extends StatefulWidget {
  const NotActiveView({super.key});

  @override
  State<NotActiveView> createState() => _NotActiveViewState();
}

class _NotActiveViewState extends State<NotActiveView> {
  late NotActiveBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Voce não possui acesso a aplicação , entre em contato com o administrador!',
              style: TextStyle(fontSize: 26),
            ),
            ElevatedButton(
              onPressed: () =>
                  bloc.dispatchEvent(NotActiveEventSignOut(context)),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              child: const Text('Sair'),
            )
          ],
        ),
      ),
    );
  }
}
