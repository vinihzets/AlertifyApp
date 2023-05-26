import 'dart:developer';

import 'package:alertifyapp/core/architecture/bloc.dart';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/users/domain/usecases/activate_user_usecase_impl.dart';
import 'package:alertifyapp/features/users/domain/usecases/fetch_users_usecase_impl.dart';
import 'package:alertifyapp/features/users/presentation/bloc/users_event.dart';

class UsersBloc extends Bloc {
  FetchUsersUseCaseImpl fetchUsersUseCaseImpl;
  ActivateUserUseCaseImpl activateUserUseCaseImpl;
  late List<UserEntity> listUser;
  UsersBloc(
    this.fetchUsersUseCaseImpl,
    this.activateUserUseCaseImpl,
  ) {
    listUser = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is UsersEventFetch) {
      _handleFetchUsers();
    } else if (event is UsersEventActivate) {
      _handleActivateUser(event.params.entity, event.params.active);
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
    active.fold((l) {
      inspect(l.message);
    }, (r) {
      dispatchState(BlocStableState(data: r));
    });
  }
}
