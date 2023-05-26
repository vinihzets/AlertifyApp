import 'package:alertifyapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:alertifyapp/features/home/presentation/bloc/home_event.dart';
import 'package:alertifyapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.isDarkState.value ? Colors.grey : Colors.blue,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildDialog() {
    return showDialog(
        builder: (context) => Dialog(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Titulo'),
                    SizedBox(
                      width: 180,
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(hintText: 'Titulo'),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: TextField(
                        controller: bodyController,
                        decoration:
                            const InputDecoration(hintText: 'Informações'),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bloc.dispatchEvent(HomeEventSendNotification(context,
                            titleController.text, bodyController.text));
                        titleController.clear();
                        bodyController.clear();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      child: const Text('Enviar'),
                    )
                  ],
                ),
              ),
            ),
        context: context);
  }
}
