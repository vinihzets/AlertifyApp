import 'package:alertifyapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:alertifyapp/features/home/presentation/bloc/home_event.dart';
import 'package:alertifyapp/features/home/presentation/ui/home_view_empty_state.dart';
import 'package:alertifyapp/features/home/presentation/ui/home_view_error_state.dart';
import 'package:alertifyapp/features/home/presentation/ui/home_view_loading_state.dart';
import 'package:alertifyapp/features/home/presentation/ui/home_view_stable_state.dart';
import 'package:alertifyapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/components/bloc_screen_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;
  late TextEditingController titleController;
  late TextEditingController bodyController;
  late ThemeState theme;

  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    theme = GetIt.I.get();
    bloc = GetIt.I.get();

    bloc.dispatchEvent(HomeEventGetCustomNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertify'),
        centerTitle: true,
        actions: [
          theme.isDarkState.value
              ? const Icon(Icons.sunny)
              : const Icon(Icons.nights_stay_sharp),
          Switch(
            value: theme.isDarkState.value,
            onChanged: (value) {
              setState(() {
                theme.isDarkState.value = value;
              });
            },
          ),
          TextButton(
              onPressed: () => bloc.dispatchEvent(HomeEventSignOut(context)),
              child: const Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => HomeViewStableState(
                state: onStable,
              ),
          onError: (onError) => HomeViewErrorState(
                state: onError,
              ),
          onLoading: (state) => const HomeViewLoadingState(),
          onEmpty: (onEmpty) => const HomeViewEmptyState()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _buildDialog(),
        label: const Text('Nova Notificação'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  _buildDialog() {
    bool isNull = false;

    return showDialog(
        builder: (context) => Dialog(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Enviar Notificação'),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 220,
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Titulo'),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 220,
                      child: TextField(
                        controller: bodyController,
                        decoration:
                            const InputDecoration(labelText: 'Informações'),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            bodyController.text.isNotEmpty) {
                          bloc.dispatchEvent(HomeEventSendNotification(context,
                              titleController.text, bodyController.text));
                          titleController.clear();
                          bodyController.clear();
                        }
                      },
                      child: const Text('Enviar'),
                    )
                  ],
                ),
              ),
            ),
        context: context);
  }
}
