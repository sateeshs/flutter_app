
import 'package:bloc/bloc.dart';
import 'package:flutter_app/models/userModel.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:meta/meta.dart';

import 'User_Add_Edit_Event.dart';
import 'User_Add_Edit_State.dart';

class UserAddEditBloc extends Bloc<UserAddEditEvent, UserAddEditState> {
  final UserService userService;

  UserAddEditBloc({@required this.userService});

  @override
  UserAddEditState get initialState => StateShowUser();

  @override
  Stream<UserAddEditState> mapEventToState(UserAddEditEvent event) async* {
    if (event is AddUser) {
      yield* _mapUserAddToState(event);
    }
    if (event is EditUser) {
      yield* _mapUserEditToState(event);
    }
  }

  Stream<UserAddEditState> _mapUserAddToState(AddUser event) async* {
    yield StateLoading();
    UserModel updatedUser = await userService.addUser(event.user);
    yield AddUserStateSuccess(updatedUser);
  }


  Stream<UserAddEditState> _mapUserEditToState(EditUser event) async* {
    yield StateLoading();
    UserModel updatedUser = await userService.editUser(event.user);
    yield EditUserStateSuccess(updatedUser);
  }

  @override
  void onTransition(Transition<UserAddEditEvent, UserAddEditState> transition) {
    print(transition);
  }
}