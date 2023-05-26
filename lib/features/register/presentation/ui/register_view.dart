import 'package:alertifyapp/core/components/bloc_screen_builder.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_bloc.dart';
import 'package:alertifyapp/features/register/presentation/bloc/register_event.dart';
import 'package:alertifyapp/features/register/presentation/ui/register_view_stable_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(RegisterEventOnReady());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          onEmpty: (onEmpty) => const SizedBox.shrink(),
          onError: (onError) => const SizedBox.shrink(),
          onLoading: (onLoading) => const SizedBox.shrink(),
          onStable: (onStable) => RegisterViewStableData(
                bloc: bloc,
              ),
          stream: bloc.state),
    );
  }
}
