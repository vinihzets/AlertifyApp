import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_bloc.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_event.dart';
import 'package:alertifyapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UsersViewStableState extends StatefulWidget {
  final BlocState state;
  final UsersBloc bloc;
  const UsersViewStableState(
      {required this.state, required this.bloc, super.key});

  @override
  State<UsersViewStableState> createState() => _UsersViewStableStateState();
}

class _UsersViewStableStateState extends State<UsersViewStableState> {
  late ThemeState theme;

  @override
  void initState() {
    theme = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<UserEntity> listUsers = widget.state.data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.isDarkState.value ? Colors.grey : Colors.blue,
        title: const Text('Usuarios'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listUsers.length,
          itemBuilder: (context, index) {
            final user = listUsers[index];

            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(user.email),
              trailing: Column(
                children: [
                  Switch(
                      value: user.active,
                      onChanged: (v) {
                        if (v) {
                          widget.bloc.dispatchEvent(UsersEventActivate(
                              ActivateUserParams(user, true)));
                        } else {
                          widget.bloc.dispatchEvent(UsersEventActivate(
                              ActivateUserParams(user, false)));
                        }
                      })
                ],
              ),
            );
          }),
    );
  }
}
