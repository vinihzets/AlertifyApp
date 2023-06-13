import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/profile/domain/usecases/delete_user_usecase_impl.dart';
import 'package:alertifyapp/features/profile/domain/usecases/fetch_user_usecase_impl.dart';
import 'package:alertifyapp/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter/material.dart';

class ProfileBloc extends Bloc {
  ConstRoutes routes;
  FetchUserUseCaseImpl fetchUserUseCaseImpl;
  DeleteUserUseCaseImpl deleteUserUseCaseImpl;
  ProfileBloc(
      this.fetchUserUseCaseImpl, this.deleteUserUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is ProfileEventGetUser) {
      _handleFetchUser();
    } else if (event is ProfileEventDeleteUser) {
      _handleDeleteUser(event.context, event.entity);
    }
  }

  _handleFetchUser() async {
    final user = await fetchUserUseCaseImpl.call(NoParams());

    user.fold((l) {}, (r) {
      dispatchState(BlocStableState(data: r));
    });
  }

  _handleDeleteUser(BuildContext context, UserEntity entity) async {
    final deleteUser = await deleteUserUseCaseImpl.call(entity);

    deleteUser.fold((l) {
      showSnack(context, 'Nao foi possivel apagar o usuario , tente novamente',
          Colors.red);
    }, (r) {
      navigateRemoveUntil(context, routes.login);
    });
  }
}
