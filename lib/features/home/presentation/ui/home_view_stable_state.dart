import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';
import 'package:flutter/material.dart';

class HomeViewStableState extends StatefulWidget {
  final BlocState state;

  const HomeViewStableState({required this.state, super.key});

  @override
  State<HomeViewStableState> createState() => _HomeViewStableStateState();
}

class _HomeViewStableStateState extends State<HomeViewStableState> {
  @override
  Widget build(BuildContext context) {
    final List<CustomNotificationEntity> listNotifications = widget.state.data;

    return ListView.builder(
      itemCount: listNotifications.length,
      itemBuilder: (BuildContext context, int index) {
        final notification = listNotifications[index];

        return ExpansionTile(
          leading: const Icon(Icons.notification_add_sharp),
          title: Text(notification.title),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                notification.message,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      },
    );
  }
}
