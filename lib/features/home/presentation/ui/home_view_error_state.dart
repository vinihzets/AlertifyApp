import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeViewErrorState extends StatelessWidget {
  final BlocState state;
  const HomeViewErrorState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
