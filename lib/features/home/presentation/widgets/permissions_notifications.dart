import 'package:flutter/material.dart';

class PermissionsNotification {
  static build(BuildContext context) {
    return showDialog(
        builder: (context) => Dialog(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('deseja receber todas notificacoes'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          child: const Text('Nao'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey)),
                          child: const Text('Receber'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
        context: context);
  }
}
