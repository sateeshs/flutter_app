import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/features/user/add_edit/bloc/User_Add_Edit_Event.dart';
import 'package:flutter_app/features/user/add_edit/bloc/User_Add_Edit_State.dart';
import 'package:flutter_app/models/userModel.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_event.dart';
import 'user_state.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  SharedPreferences pref;
  final UserService userService;
  UserBloc({@required this.userService});

  @override
  UserState get initialState => UserState.initial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is SaveUserName) {
      pref.setString("username", event.username);
    }
    if (event is SaveId) {
      pref = await SharedPreferences.getInstance();
      pref.setString("id", event.id);
    }
    if (event is SaveEmail) {
      pref = await SharedPreferences.getInstance();
      pref.setString("email", event.email);
    }
    if (event is SaveToken) {
      pref = await SharedPreferences.getInstance();
      pref.setString("token", event.token);
    }
    if (event is RemoveToken) {
      pref = await SharedPreferences.getInstance();
      pref.remove("token");
    }
    if (event is SaveMobile) {
      pref = await SharedPreferences.getInstance();
      pref.setString("mobile", event.mobile);
    }
    //GET LOGIN DETAILS
    if (event is GetLoginDetails) {
      pref = await SharedPreferences.getInstance();
      yield state.copyWith(mobile: pref.getString('mobile'), userName: pref.getString('username'));
    }
  }

  Stream<UserAddEditState> _mapUserAddToState(AddUser event) async* {
    yield StateLoading();
    //UserBase updatedUser = await lyricsRepository.addUser(event.User);
    UserModel updatedUser = await userService.addUser(event.user);
    yield AddUserStateSuccess(updatedUser);
  }
/*
  void saveUserName(username) {
    //dispatch(SaveUserName(username: username));
  }
  void saveId(id) {
    dispatch(SaveId(id: id));
  }
  void saveAuthToken(token) {
    dispatch(SaveToken(token: token));
  }
  void saveEmail(email) {
    dispatch(SaveEmail(email: email));
  }
  void saveMobile(mobile) {
    dispatch(SaveMobile(mobile: mobile));
  }
  void getLoginDetails() {
    dispatch(GetLoginDetails());
  }*/
}
