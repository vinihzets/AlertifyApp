import 'package:alertifyapp/core/components/bloc_screen_builder.dart';
import 'package:alertifyapp/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:alertifyapp/features/profile/presentation/bloc/profile_event.dart';
import 'package:alertifyapp/features/profile/presentation/views/profile_view_empty_state.dart';
import 'package:alertifyapp/features/profile/presentation/views/profile_view_error_state.dart';
import 'package:alertifyapp/features/profile/presentation/views/profile_view_loading_state.dart';
import 'package:alertifyapp/features/profile/presentation/views/profile_view_stable_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileBloc bloc;
  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(ProfileEventGetUser());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocScreenBuilder(
        stream: bloc.state,
        onStable: (onStable) => ProfileViewStableState(
              state: onStable,
              bloc: bloc,
            ),
        onError: (onError) => ProfileViewErrorState(),
        onLoading: (onLoading) => ProfileViewLoadingState(),
        onEmpty: (onEmpty) => ProfileViewEmptyState());
  }
}
