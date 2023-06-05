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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const Text(
                'Você ainda não possui acesso, aguarde um administrador',
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () =>
                    bloc.dispatchEvent(NotActiveEventSignOut(context)),
                child: const Text('Sair'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
