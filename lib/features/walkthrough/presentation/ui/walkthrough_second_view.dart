import 'package:alertifyapp/features/walkthrough/presentation/widgets/walkthrough_page_widget.dart';
import 'package:flutter/material.dart';

class WalkthroughSecondView extends StatelessWidget {
  const WalkthroughSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalkthroughPage(
      isFinal: true,
      description:
          'Apos fazer login na aplicação, Voce deve pressionar o botao , e simular sua notificaçao enviando a mensagem e o titulo da notificação',
      imageUrl: '',
      title: 'Simule suas Notificaçoes',
    );
  }
}
