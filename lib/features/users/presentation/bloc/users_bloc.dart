import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/users/domain/usecases/activate_user_usecase_impl.dart';
import 'package:alertifyapp/features/users/domain/usecases/delete_users_usecase_impl.dart';
import 'package:alertifyapp/features/users/domain/usecases/fetch_users_usecase_impl.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_event.dart';
import 'package:flutter/material.dart';

class UsersBloc extends Bloc {
  FetchUsersUseCaseImpl fetchUsersUseCaseImpl;
  ActivateUserUseCaseImpl activateUserUseCaseImpl;
  DeleteUsersUseCaseImpl deleteUserUseCaseImpl;
  late List<UserEntity> listUser;
  UsersBloc(this.fetchUsersUseCaseImpl, this.activateUserUseCaseImpl,
      this.deleteUserUseCaseImpl) {
    listUser = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is UsersEventFetch) {
      _handleFetchUsers();
    } else if (event is UsersEventActivate) {
      _handleActivateUser(event.params.entity, event.params.active);
    } else if (event is UsersEventDeleteUser) {
      _handleDeleteUser(event.context, event.entity);
    }
  }

  _handleFetchUsers() async {
    final fetchUsers = await fetchUsersUseCaseImpl.call(NoParams());
    fetchUsers.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      if (r.isEmpty) {
        dispatchState(BlocEmptyState());
      }
      listUser.addAll(r);
      dispatchState(BlocStableState(data: listUser));
    });
  }

  _handleActivateUser(UserEntity entity, bool activeordesactive) async {
    final active = await activateUserUseCaseImpl
        .call(ActivateUserParams(entity, activeordesactive));
    active.fold((l) {}, (r) {
      dispatchState(BlocStableState(data: r));
    });
  }

  _handleDeleteUser(BuildContext context, UserEntity entity) async {
    dispatchState(BlocLoadingState());
    final deleteUserRequest = await deleteUserUseCaseImpl.call(entity);

    deleteUserRequest.fold((l) {
      showSnack(context, 'Erro ao tentar deletar esse usuario', Colors.red);
    }, (r) {
      listUser.removeWhere((user) => user.email == entity.email);

      dispatchState(BlocStableState(data: listUser));
    });
  }
}
