import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late ValueNotifier<bool> permissionsGranted;

  @override
  void initState() {
    permissionsGranted = ValueNotifier(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(
            Icons.app_settings_alt_outlined,
            size: 89,
          ),
          const Text('Permissão de receber notificações'),
          Switch(
              value: permissionsGranted.value,
              onChanged: (v) {
                setState(() {
                  permissionsGranted.value = v;
                });
              })
        ]),
      ),
    );
  }
}
