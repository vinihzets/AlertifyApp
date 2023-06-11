import 'package:flutter/material.dart';

class HomeViewEmptyState extends StatelessWidget {
  const HomeViewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_active_sharp,
            size: 102,
          ),
          SizedBox(
            height: 24,
          ),
          Text('Nenhuma Notificação Enviada ate o momento!')
        ],
      ),
    );
  }
}
