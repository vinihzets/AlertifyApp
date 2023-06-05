import 'package:alertifyapp/features/walkthrough/presentation/widgets/walkthrough_page_widget.dart';
import 'package:flutter/material.dart';

class WalkThroughFirstView extends StatelessWidget {
  const WalkThroughFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalkthroughPage(
      isFinal: false,
      description:
          'Primeiro faça cadastro na aplicação, apos isso aguarde que um administrador libere seu acesso!',
      imageUrl: '',
      title: 'Autenticação',
    );
  }
}
