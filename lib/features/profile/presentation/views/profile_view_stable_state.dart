import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alertifyapp/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter/material.dart';

class ProfileViewStableState extends StatefulWidget {
  final BlocState state;
  final ProfileBloc bloc;
  const ProfileViewStableState(
      {required this.state, required this.bloc, super.key});

  @override
  State<ProfileViewStableState> createState() => _ProfileViewStableStateState();
}

class _ProfileViewStableStateState extends State<ProfileViewStableState> {
  @override
  Widget build(BuildContext context) {
    final UserEntity user = widget.state.data;

    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 20.0,
              child: Icon(
                Icons.person_2_outlined,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              user.email,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                widget.bloc
                    .dispatchEvent(ProfileEventDeleteUser(context, user));
              },
              child: const Text('Apagar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
