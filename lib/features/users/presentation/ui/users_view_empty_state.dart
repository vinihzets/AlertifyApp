import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:flutter/material.dart';

class UsersViewEmptyState extends StatelessWidget {
  final BlocState state;
  const UsersViewEmptyState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [const Text('Nao existe nenhum usuario cadastrado')]),
    );
  }
}
