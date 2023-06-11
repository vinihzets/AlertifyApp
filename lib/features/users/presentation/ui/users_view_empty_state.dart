import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:flutter/material.dart';

class UsersViewEmptyState extends StatelessWidget {
  final BlocState state;
  const UsersViewEmptyState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [Text('Nao existe nenhum usuario cadastrado')]),
    );
  }
}
