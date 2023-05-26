import 'package:alertifyapp/core/components/bloc_screen_builder.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_bloc.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_event.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view_empty_state.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view_error_state.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view_loading_state.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view_stable_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late UsersBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(UsersEventFetch());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocScreenBuilder(
      onEmpty: (state) => UsersViewEmptyState(state: state),
      onError: (state) => UsersViewErrorState(state: state),
      onLoading: (state) => UsersViewLoadingState(state: state),
      onStable: (state) => UsersViewStableState(state: state, bloc: bloc),
      stream: bloc.state,
    );
  }
}
